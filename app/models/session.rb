class Session < ApplicationRecord

	validates :student_id, presence: {message: "学籍番号を入力してください"}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/,message: "学籍番号は半角英数で入力してください"}, length: { in: 8..9 }
	validates :password, confirmation: true,presence: {message: "パスワードを入力してください"}, length: { in: 6..24 ,message:"パスワードは6文字以上24文字以下で入力してください"}, if: :password

end
