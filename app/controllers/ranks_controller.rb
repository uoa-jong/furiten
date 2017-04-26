class RanksController < ApplicationController

	def index
		#@game = Game.where("? <= game_date && ? >= game_date",params[:start_time],params[:end_time])
		@game =Game.all
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
			user.save
		end
		@users = User.all.order(total_score: :desc)
	end

	def create

	end
end
