require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :phone_array => "MyString",
      :whatsapp => "MyString",
      :skype => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_phone_array[name=?]", "contact[phone_array]"

      assert_select "input#contact_whatsapp[name=?]", "contact[whatsapp]"

      assert_select "input#contact_skype[name=?]", "contact[skype]"

      assert_select "input#contact_email[name=?]", "contact[email]"
    end
  end
end
