require 'rails_helper'

RSpec.describe "csps/index", type: :view do
  before(:each) do
    assign(:csps, [
      Csp.create!(
        :number => "Csp Number",
        :nursery_id => 1,
        :dm_number => "Dm Number",
        :password => "Password"
      ),
      Csp.create!(
        :number => "Csp Number",
        :nursery_id => 1,
        :dm_number => "Dm Number",
        :password => "Password"
      )
    ])
  end

  it "renders a list of csps" do
    render
    assert_select "tr>td", :text => "Csp Number".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Dm Number".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
