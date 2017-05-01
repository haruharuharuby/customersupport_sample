require 'rails_helper'

RSpec.describe "sending_objects/show", type: :view do
  before(:each) do
    @sending_object = assign(:sending_object, SendingObject.create!(
      :name => "Name",
      :nursery_id => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Description/)
  end
end
