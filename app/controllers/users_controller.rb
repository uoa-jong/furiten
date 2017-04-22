class UsersController < ApplicationController
	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(params_user)
    	email = params_user[:email]
    	password  = params_user[:password]

  		if @user.save
  			#login 処理
  			session[:user_id] = @user.id
  			#to mypage
  			redirect_to user_path(@user) , notice: "サインインしました"
  		else
  			render :new
  		end
  	end

  	def show
  		@user = User.find(params[:id])
  	end

  	def destroy 
  		@user = User.find(params[:id])
  		if @user.destroy
  			redirect_to sessions_path
  		else
  			redirect_to sessions_path
  		end
  	end

private
	def params_user
		params.require(:user).permit(:student_id,:password,:user_name,:password_confirmation)
	end


end
