class UsersController < ApplicationController
	def new
  		@user = User.new
  	end

  	def create
  		@user = User.create_normal_user(params_user) 

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
  		@games = Game.where("?=e_userid",params[:id]).or(Game.where("?=s_userid",params[:id])).or(Game.where("?=w_userid",params[:id])).or(Game.where("?=n_userid",params[:id])).page(params[:page]).order(game_date: :desc)
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