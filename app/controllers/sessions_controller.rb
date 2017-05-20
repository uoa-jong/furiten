class SessionsController < ApplicationController
	def new
		@user = User.new
		#redirect_to user[:id] if logged_in?
	end

	def index
		@users = User.all
    @roles = Role.all

	end

  def update
    user = User.find(params[:user_id])
    user.role_id = params[:role]
    user.onlist = params[:onlist]
    user.save
    redirect_to sessions_path
  end

	def create
  		user = User.find_by(student_id: params_user[:student_id])

  		if user and user.authenticate(params_user[:password])
  			session[:user_id] = user.id
  			redirect_to user_path(user), notice: "サインインしました"
  		else 
  			redirect_to new_session_path, notice: "サインインに失敗しました"
  		end
  	end
  	
  	def destroy
  		@user = User.find(params[:id])
    	session[:user_id] = nil
    	redirect_to new_session_path, notice: "サインアウトしました"
	  end

	private
  		def params_user
  			params.require(:user).permit(:student_id,:password)
  		end
end
