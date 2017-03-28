require 'rails_helper'

RSpec.describe Review, type: :model do
 	it { should belong_to(:tutorial) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:content) }
end
