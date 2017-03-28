require 'rails_helper'

RSpec.describe Rating, type: :model do
  	it { should belong_to(:tutorial)}
	it { should validate_presence_of(:value) }
end
