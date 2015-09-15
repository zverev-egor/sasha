require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :phone_array => "Phone Array",
      :whatsapp => "Whatsapp",
      :skype => "Skype",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Array/)
    expect(rendered).to match(/Whatsapp/)
    expect(rendered).to match(/Skype/)
    expect(rendered).to match(/Email/)
  end
end
