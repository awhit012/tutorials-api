class Rating < ApplicationRecord
  	belongs_to :tutorial
	validates_presence_of :value
end
