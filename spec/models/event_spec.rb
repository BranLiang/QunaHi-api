require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end
end
