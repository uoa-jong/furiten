class User < ApplicationRecord
	has_secure_password

   mount_uploader :image, ImageUploader

   validates :student_id, presence: {message: "学籍番号を入力してください"},
                           uniqueness: { case_sensitive: false },
                           format: { with: /\A[a-z][a-z0-9]+\z/ ,message: "学籍番号はsを含めた半角英数で入力してください"},
                           length: { in: 8..9 , message: "学籍番号は入力文字数は8文字です" }
   
   validates :user_name, presence: {message: "ユーザー名を入力してください"},
                        length: { maximum: 15 }
   
   #validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ , message: "入力されたメールアドレスが正しくありません"}
   #validates :profile,  length: {in: 0..200,message:"bioは200文字以内で入力してください"}
   validates :password, confirmation: true,presence: {message: "パスワードを入力してください"}, length: { in: 6..24 }, if: :password
   validates :password_confirmation ,presence: {message: "確認用パスワードを入力してください"}, if: :password 

   def self.create_normal_user(params)
   		user = self.new(params)
   		user.role_id = Role.find_by(role_name: "一般").id
         user.total_score = 0.0
         user.game_count = 0
   		user
   end

end
