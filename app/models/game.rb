class Game < ApplicationRecord
	belongs_to :user

	attr_accessor :e_pm,:s_pm,:w_pm,:n_pm


	validates :game_date, presence: {message: "日付を選択してください"}
	
	validates :e_userid, presence: {message: "[東]ユーザーを選択してください"}
	validates :e_score, presence: {message: "[東]スコアを入力してください"} ,
						format: { with: /\A[0-9][0-9.]+\z/ , message: "[東]スコアは半角数字で入力してください"},
						numericality: {greater_than_or_equal_to: -200,less_than: 200 ,message:"[東]スコアの値が正しくありません"}
	
	validates :s_userid, presence: {message: "[南]ユーザーを選択してください"}
	validates :s_score, presence: {message: "[南]スコアを入力してください"} ,
						format: { with: /\A[0-9][0-9.]+\z/ , message: "[南]スコアは半角数字で入力してください"},
						numericality: {greater_than_or_equal_to: -200,less_than: 200 ,message:"[南]スコアの値が正しくありません"}

	validates :w_userid, presence: {message: "[西]ユーザーを選択してください"}
	validates :w_score, presence: {message: "[西]スコアを入力してください"} ,
						format: { with: /\A[0-9][0-9.]+\z/ , message: "[西]スコアは半角数字で入力してください"},
						numericality: {greater_than_or_equal_to: -200,less_than: 200 ,message:"[西]スコアの値が正しくありません"}

	validates :n_userid, presence: {message: "[北]ユーザーを選択してください"}
	validates :n_score, presence: {message: "[北]スコアを入力してください"} ,
						format: { with: /\A[0-9][0-9.]+\z/ , message: "[北]スコアは半角数字で入力してください"},
						numericality: {greater_than_or_equal_to: -200,less_than: 200 ,message:"[北]スコアの値が正しくありません"}

	validate :check_total_score_equals_0
	validate :check_sameuser


	#validates params[:e_score]+params[:s_score]+params[:w_score]+params[:n_score], numericality:{equal_to: 0}

	def check_total_score_equals_0 
		total_score = [e_score, s_score, w_score, n_score].reject{|i| i.nil? }.inject(:+)
		if total_score != 0 
			errors.add(:base, "合計値が0ではありません。")
		end
	end
	
	def check_sameuser
		user_list = [e_userid, s_userid,w_userid,n_userid]
		if user_list.length != user_list.uniq.length
			errors.add(:base, "同じユーザーが選択されています")
		end

	end
end
