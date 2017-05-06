class RanksController < ApplicationController

	def index
		@start_time =  params[:start_time].nil? ? (Time.now.prev_year) : params[:start_time].to_datetime
		@end_time =  params[:end_time].nil? ? (Time.now) : params[:end_time].to_datetime
		@game_limit = params[:game_limit].nil? ? (1) : params[:game_limit].to_i

		#@game = Game.where(game_date: [@start_time..@end_time])
		@game = Game.where("game_date BETWEEN ? AND ? " ,@start_time,@end_time)
		@users = User.all


		@users.each do |u|
			user = User.find(u.id)
			totalscore = 0
			game_count = 0
			@game.each do |g|
				if g.e_userid == u.id
					totalscore += g.e_score
					game_count += 1
				elsif g.s_userid == u.id
					totalscore += g.s_score
					game_count += 1
				elsif g.w_userid == u.id
					totalscore += g.w_score
					game_count += 1
				elsif g.n_userid == u.id
					totalscore += g.n_score
					game_count += 1
				end	
			end
			user.total_score = totalscore
			user.game_count = game_count
			if user.save
				p "Can"
			else
				p "Can't Save"
			end
		end
		@users = User.where("game_count >= ?",@game_limit).order(total_score: :desc)
	end

	def create

	end
end
