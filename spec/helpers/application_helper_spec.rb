require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ContractsHelper. For example:
#
# describe ContractsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "i18n translation" do
    it "second navigation translation" do
      expect(helper.second_navigation).to eq(["献立"])
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
