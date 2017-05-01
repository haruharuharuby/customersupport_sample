require 'rails_helper'

RSpec.describe "nurseries/new", type: :view do
  before(:each) do
    assign(:nursery, Nursery.new(
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :responder => "MyString"
    ))
  end

  it "renders new nursery form" do
    render

    assert_select "form[action=?][method=?]", nurseries_path, "post" do

      assert_select "input#nursery_name[name=?]", "nursery[name]"

      assert_select "input#nursery_address[name=?]", "nursery[address]"

      assert_select "input#nursery_phone[name=?]", "nursery[phone]"

      assert_select "input#nursery_fax[name=?]", "nursery[fax]"

      assert_select "input#nursery_email[name=?]", "nursery[email]"

      assert_select "input#nursery_responder[name=?]", "nursery[responder]"
    end
  end
end
