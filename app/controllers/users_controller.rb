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

      now = Time.zone.now
      @time = Time.zone.local(now.year,now.month,1)

      @score = Array[0,0,0,0]
      @plays = Array[0,0,0,0]
      
      for i in 0..3 do
        if i != 0 then
          game = Game.where("game_date BETWEEN ? AND ? " ,@time.ago(i.month),@time.ago(i-1.month)-1)
        else
          game = Game.where("game_date BETWEEN ? AND ? " ,@time,@time.since(1.month)-1)
        end
        game.each do |g|
          if g.e_userid == @user.id
            @score[i] += g.e_score
            @plays[i] += 1
          elsif g.s_userid == @user.id
            @score[i] += g.e_score
            @plays[i] += 1
          elsif g.w_userid == @user.id
            @score[i] += g.e_score
            @plays[i] += 1
          elsif g.n_userid == @user.id
            @score[i] += g.e_score
            @plays[i] += 1
          end 
        end
      end


      #Scores
      data_score = GoogleVisualr::DataTable.new
      data_score.new_column('string', '月' )
      data_score.new_column('number', 'pt')

      data_score.add_rows([
        [@time.ago(3.month).month.to_s, @score[3]],
        [@time.ago(2.month).month.to_s, @score[2]],
        [@time.ago(1.month).month.to_s, @score[1]],
        [@time.month.to_s, @score[0]]
      ])

      #Plays
      data_plays = GoogleVisualr::DataTable.new
      data_plays.new_column('string', '月' )
      data_plays.new_column('number', '半荘')

      data_plays.add_rows([
        [@time.ago(3.month).month.to_s, @plays[3]],
        [@time.ago(2.month).month.to_s, @plays[2]],
        [@time.ago(1.month).month.to_s, @plays[1]],
        [@time.month.to_s, @plays[0]]      ])

      #score
      option_score = { width:"100%", height:"100%", title: "スコア" }
      @chart_score = GoogleVisualr::Interactive::AreaChart.new(data_score, option_score)
      #ranks
      option_play = { width:"100%", height:"100%", title: "対局数" }
      @chart_counts = GoogleVisualr::Interactive::AreaChart.new(data_plays, option_play)
  	end

  	def destroy 
  		@user = User.find(params[:id])
  		if @user.destroy
  			redirect_to sessions_path
  		else
  			redirect_to sessions_path
  		end
  	end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params_user)
        redirect_to user_path(params[:id])
      else
        render :edit
      end
    end

    def index
      redirect_to new_user_path
    end


private
	def params_user
		params.require(:user).permit(:student_id,:password,:user_name,:password_confirmation,:image,:image_cache,:email,:profile)
	end


end
