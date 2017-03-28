class Tutorial < ApplicationRecord
	validates_presence_of :title, :description, :url
	has_many :ratings, dependent: :destroy
	has_many :reviews, dependent: :destroy
end
