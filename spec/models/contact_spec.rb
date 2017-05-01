require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :content }
end
