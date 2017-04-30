class User < ApplicationRecord
	has_secure_password

   mount_uploader :image, ImageUploader

   validates :student_id, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 8..9 }
   validates :user_name, presence: true,length: { maximum: 15 }
   validates :password, confirmation: true,presence: true, length: { in: 6..24 }, if: :password
   validates :password_confirmation,presence: true, presence: true, if: :password 

   def self.create_normal_user(params)
   		user = self.new(params)
   		user.role_id = Role.find_by(role_name: "一般").id
   		user
   end

end
