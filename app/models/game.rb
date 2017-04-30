class Game < ApplicationRecord
	belongs_to :user

	validates :game_date, presence: true
	validates :e_userid, presence: true
	validates :e_score, presence: true
	validates :s_userid, presence: true
	validates :s_score, presence: true
	validates :w_userid, presence: true
	validates :w_score, presence: true
	validates :n_userid, presence: true
	validates :n_score, presence: true
	validate :check_total_score_equals_0
	


	#validates params[:e_score]+params[:s_score]+params[:w_score]+params[:n_score], numericality:{equal_to: 0}

	def check_total_score_equals_0 
		total_score = [e_score, s_score, w_score, n_score].reject{|i| i.nil? }.inject(:+)
		if total_score != 0 
			errors.add(:base, "total scores != 0")
		end
	end
end
