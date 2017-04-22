class User < ApplicationRecord
	has_secure_password

   validates :student_id, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 8..9 }
   validates :user_name, presence: true,length: { maximum: 15 }
   validates :password, confirmation: true,presence: true, length: { in: 6..24 }, if: :password
   validates :password_confirmation,presence: true, presence: true, if: :password 



end
