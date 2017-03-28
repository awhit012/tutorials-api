class Review < ApplicationRecord
  belongs_to :tutorial
  validates_presence_of :title, :content
end
