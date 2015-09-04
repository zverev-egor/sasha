require 'rails_helper'

RSpec.describe "welcomes/new", type: :view do
  before(:each) do
    assign(:welcome, Welcome.new(
      :description => "MyText"
    ))
  end

  it "renders new welcome form" do
    render

    assert_select "form[action=?][method=?]", welcomes_path, "post" do

      assert_select "textarea#welcome_description[name=?]", "welcome[description]"
    end
  end
end
