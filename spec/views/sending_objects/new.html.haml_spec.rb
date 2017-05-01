require 'rails_helper'

RSpec.describe "sending_objects/new", type: :view do
  before(:each) do
    assign(:sending_object, SendingObject.new(
      :name => "MyString",
      :nursery_id => 1,
      :description => "MyString"
    ))
  end

  it "renders new sending_object form" do
    render

    assert_select "form[action=?][method=?]", sending_objects_path, "post" do

      assert_select "input#sending_object_name[name=?]", "sending_object[name]"

      assert_select "input#sending_object_nursery_id[name=?]", "sending_object[nursery_id]"

      assert_select "input#sending_object_description[name=?]", "sending_object[description]"
    end
  end
end
