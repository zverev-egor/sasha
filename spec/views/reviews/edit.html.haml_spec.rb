require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :description => "MyText",
      :login => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "textarea#review_description[name=?]", "review[description]"

      assert_select "input#review_login[name=?]", "review[login]"

      assert_select "input#review_name[name=?]", "review[name]"
    end
  end
end
