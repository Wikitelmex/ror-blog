require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      name: "MyString",
      photo: "MyString",
      bio: "MyText",
      updated: "MyString",
      created: "MyString",
      postscounter: 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[photo]"

      assert_select "textarea[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[updated]"

      assert_select "input[name=?]", "user[created]"

      assert_select "input[name=?]", "user[postscounter]"
    end
  end
end
