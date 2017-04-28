class Review < ApplicationRecord
  belongs_to :tutorial
  validates_presence_of :title, :content
  acts_as_votable
end
