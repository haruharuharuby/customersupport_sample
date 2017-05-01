require 'rails_helper'

RSpec.describe "sending_objects/index", type: :view do
  before(:each) do
    assign(:sending_objects, [
      SendingObject.create!(
        :name => "Name",
        :nursery_id => 1,
        :description => "Description"
      ),
      SendingObject.create!(
        :name => "Name",
        :nursery_id => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of sending_objects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
