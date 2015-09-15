require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :description => "MyText",
        :login => "Login",
        :name => "Name"
      ),
      Review.create!(
        :description => "MyText",
        :login => "Login",
        :name => "Name"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
