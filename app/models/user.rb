class User < ApplicationRecord
	has_secure_password

   mount_uploader :image, ImageUploader

   validates :student_id, presence: {message: "学籍番号を入力してください"},
                           uniqueness: { case_sensitive: false },
                           format: { with: /\A[a-z][a-z0-9]+\z/ ,message: "半角英数で入力してください"},
                           length: { in: 8..9 , message: "入力文字数は8文字です" }
   
   validates :user_name, presence: {message: "ユーザー名を入力してください"},
                        length: { maximum: 15 }
   validates :password, confirmation: true,presence: {message: "パスワードを入力してください"}, length: { in: 6..24 }, if: :password
   validates :password_confirmation ,presence: {message: "確認用パスワードを入力してください"}, if: :password 

   def self.create_normal_user(params)
   		user = self.new(params)
   		user.role_id = Role.find_by(role_name: "一般").id
   		user
   end

end
