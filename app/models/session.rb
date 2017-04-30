class Session < ApplicationRecord

	validates :student_id, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 8..9 }
	validates :password, confirmation: true,presence: true, length: { in: 6..24 }, if: :password

end
