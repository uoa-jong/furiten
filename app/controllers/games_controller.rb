class GamesController < ApplicationController

	before_action :set_select_collections, only: [:edit, :update, :new, :create]

	def new
		@game = Game.new
		@users = User.all
		@time = Time.now
		@rules = Rule.all
	end

	def create
		params[:game][:e_score] = params[:game][:e_pm].to_f * params[:game][:e_score].to_f
		params[:game][:s_score] = params[:game][:s_pm].to_f * params[:game][:s_score].to_f
		params[:game][:w_score] = params[:game][:w_pm].to_f * params[:game][:w_score].to_f
		params[:game][:n_score] = params[:game][:n_pm].to_f * params[:game][:n_score].to_f
		i = params_game
		# modify i 
		# i[:e_score] 
		@game = Game.new(i)
		@game.rule_id = params[:rule]
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
		@rules = Rule.all
	end

	def update
		@game = Game.find(params[:id])
		@game.rule_id = params[:rule]
		if @game.update_attributes(params_game)
			redirect_to games_path(params[:id])
		else 
			render :edit
		end
	end

	def destroy
  		@game = Game.find(params[:id])
    	@game.destroy
    	redirect_to games_path, notice: "対局を一件削除しました。"
	end



	private
		def params_game
			params.require(:game).permit(:e_userid,:e_score,:s_userid,:s_score,:w_userid,:w_score,:n_userid,:n_score,:game_date,:rule)
		end
		def set_select_collections
      		@users = Game.all
    	end
end
