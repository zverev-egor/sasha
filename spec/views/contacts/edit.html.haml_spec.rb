require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :phone_array => "MyString",
      :whatsapp => "MyString",
      :skype => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_phone_array[name=?]", "contact[phone_array]"

      assert_select "input#contact_whatsapp[name=?]", "contact[whatsapp]"

      assert_select "input#contact_skype[name=?]", "contact[skype]"

      assert_select "input#contact_email[name=?]", "contact[email]"
    end
  end
end
