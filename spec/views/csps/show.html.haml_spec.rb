require 'rails_helper'

RSpec.describe "csps/show", type: :view do
  before(:each) do
    @csp = assign(:csp, Csp.create!(
      :number => "Csp Number",
      :nursery_id => 1,
      :dm_number => "Dm Number",
      :password => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Csp Number/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Dm Number/)
    expect(rendered).to match(/Password/)
  end
end
