require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :phone_array => "Phone Array",
        :whatsapp => "Whatsapp",
        :skype => "Skype",
        :email => "Email"
      ),
      Contact.create!(
        :phone_array => "Phone Array",
        :whatsapp => "Whatsapp",
        :skype => "Skype",
        :email => "Email"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Phone Array".to_s, :count => 2
    assert_select "tr>td", :text => "Whatsapp".to_s, :count => 2
    assert_select "tr>td", :text => "Skype".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
