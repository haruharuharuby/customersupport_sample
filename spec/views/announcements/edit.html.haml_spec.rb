require 'rails_helper'

RSpec.describe "announcements/edit", type: :view do
  before(:each) do
    @announcement = assign(:announcement, Announcement.create!(
      :title => "MyString",
      :content => "MyString"
    ))
  end

  it "renders the edit announcement form" do
    render

    assert_select "form[action=?][method=?]", announcement_path(@announcement), "post" do

      assert_select "input#announcement_title[name=?]", "announcement[title]"

      assert_select "input#announcement_content[name=?]", "announcement[content]"
    end
  end
end
