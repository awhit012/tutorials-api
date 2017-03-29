class User < ApplicationRecord
	validates_presence_of :email, :password

	has_many :tutorials, dependent: :destroy
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy
end
