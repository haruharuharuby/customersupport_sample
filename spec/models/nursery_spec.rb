require 'rails_helper'

RSpec.describe Nursery, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is NG when format is wrong" do
    n = Nursery.new(name:"test", )
  end
end
