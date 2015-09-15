require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :description => "MyText",
      :login => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "textarea#review_description[name=?]", "review[description]"

      assert_select "input#review_login[name=?]", "review[login]"

      assert_select "input#review_name[name=?]", "review[name]"
    end
  end
end
