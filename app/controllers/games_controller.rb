class GamesController < ApplicationController
	def new
		@game = Game.new
	end

	def create
		@game = Game.new(params_game)
		if @game.save
			redirect_to games_path
		else 
			render :new
		end
	end

	def index
		@games = Game.all.page(params[:page]).order(game_date: :desc)
	end




	private
		def params_game
			params.require(:game).permit(:e_userid,:e_score,:s_userid,:s_score,:w_userid,:w_score,:n_userid,:n_score,:game_date)
		end

end
