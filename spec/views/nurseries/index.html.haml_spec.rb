require 'rails_helper'

RSpec.describe "nurseries/index", type: :view do
  before(:each) do
    assign(:nurseries, [
      Nursery.create!(
        :name => "Name",
        :address => "Address",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :responder => "Responder"
      ),
      Nursery.create!(
        :name => "Name",
        :address => "Address",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :responder => "Responder"
      )
    ])
  end

  it "renders a list of nurseries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Responder".to_s, :count => 2
  end
end
