require 'rails_helper'

RSpec.describe "csps/new", type: :view do
  before(:each) do
    assign(:csp, Csp.new(
      :number => "MyString",
      :nursery_id => 1,
      :dm_number => "MyString",
      :password => "MyString"
    ))
  end

  it "renders new csp form" do
    render

    assert_select "form[action=?][method=?]", csps_path, "post" do

      assert_select "input#number[name=?]", "csp[number]"

      assert_select "input#csp_nursery_id[name=?]", "csp[nursery_id]"

      assert_select "input#csp_dm_number[name=?]", "csp[dm_number]"

      assert_select "input#csp_password[name=?]", "csp[password]"
    end
  end
end
