require 'rails_helper'

RSpec.describe User, type: :model do
	it { should have_many(:tutorials).dependent(:destroy) }
	it { should have_many(:reviews).dependent(:destroy) }
	# it { should have_many(:ratings).dependent(:destroy) }

	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
end
