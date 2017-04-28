class Tutorial < ApplicationRecord
	validates_presence_of :title, :description, :url
	validates :url, uniqueness: true
	has_many :reviews, dependent: :destroy
	acts_as_taggable_on :category
	acts_as_votable
end
