class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

	has_many :tutorials, dependent: :destroy
	has_many :reviews, dependent: :destroy
end