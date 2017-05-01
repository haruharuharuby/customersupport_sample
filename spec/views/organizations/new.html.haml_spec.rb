require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input#organization_name[name=?]", "organization[name]"

      assert_select "input#organization_address[name=?]", "organization[address]"

      assert_select "input#organization_phone[name=?]", "organization[phone]"

      assert_select "input#organization_fax[name=?]", "organization[fax]"

      assert_select "input#organization_email[name=?]", "organization[email]"
    end
  end
end
