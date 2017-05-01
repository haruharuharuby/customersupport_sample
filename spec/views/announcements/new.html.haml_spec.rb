require 'rails_helper'

RSpec.describe "announcements/new", type: :view do
  before(:each) do
    assign(:announcement, Announcement.new(
      :title => "MyString",
      :content => "MyString"
    ))
  end

  it "renders new announcement form" do
    render

    assert_select "form[action=?][method=?]", announcements_path, "post" do

      assert_select "input#announcement_title[name=?]", "announcement[title]"

      assert_select "input#announcement_content[name=?]", "announcement[content]"
    end
  end
end
