require 'rails_helper'

RSpec.describe "nurseries/edit", type: :view do
  before(:each) do
    @nursery = assign(:nursery, Nursery.create!(
      :name => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :responder => "MyString"
    ))
  end

  it "renders the edit nursery form" do
    render

    assert_select "form[action=?][method=?]", nursery_path(@nursery), "post" do

      assert_select "input#nursery_name[name=?]", "nursery[name]"

      assert_select "input#nursery_address[name=?]", "nursery[address]"

      assert_select "input#nursery_phone[name=?]", "nursery[phone]"

      assert_select "input#nursery_fax[name=?]", "nursery[fax]"

      assert_select "input#nursery_email[name=?]", "nursery[email]"

      assert_select "input#nursery_responder[name=?]", "nursery[responder]"
    end
  end
end
