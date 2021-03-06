require 'rails_helper'

RSpec.describe Tutorial, type: :model do
	it { should have_many(:reviews).dependent(:destroy) }
	# it { should have_many(:ratings).dependent(:destroy) }

	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:url) }
	it { should validate_uniqueness_of(:url) }
end
