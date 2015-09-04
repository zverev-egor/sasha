require 'rails_helper'

RSpec.describe "welcomes/edit", type: :view do
  before(:each) do
    @welcome = assign(:welcome, Welcome.create!(
      :description => "MyText"
    ))
  end

  it "renders the edit welcome form" do
    render

    assert_select "form[action=?][method=?]", welcome_path(@welcome), "post" do

      assert_select "textarea#welcome_description[name=?]", "welcome[description]"
    end
  end
end
