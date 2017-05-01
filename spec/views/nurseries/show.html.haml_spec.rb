require 'rails_helper'

RSpec.describe "nurseries/show", type: :view do
  before(:each) do
    @nursery = assign(:nursery, Nursery.create!(
      :name => "Name",
      :address => "Address",
      :phone => "Phone",
      :fax => "Fax",
      :email => "Email",
      :responder => "Responder"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Responder/)
  end
end
