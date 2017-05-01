require 'rails_helper'

RSpec.describe "announcements/show", type: :view do
  before(:each) do
    @announcement = assign(:announcement, Announcement.create!(
      :title => "Title",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end
end
