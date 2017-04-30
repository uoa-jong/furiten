class GamesController < ApplicationController

	before_action :set_select_collections, only: [:edit, :update, :new, :create]

	def new
		@game = Game.new
		@users = User.all
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

	def edit
		@game = Game.find(params[:id])
		@users = User.all
	end

	def update
		@game = Game.find(params[:id])
		if @game.update_attributes(params_game)
			redirect_to games_path(params[:id])
		else 
			render :edit
		end
	end




	private
		def params_game
			params.require(:game).permit(:e_userid,:e_score,:s_userid,:s_score,:w_userid,:w_score,:n_userid,:n_score,:game_date)
		end
		def set_select_collections
      		@users = Game.all
    	end
end
