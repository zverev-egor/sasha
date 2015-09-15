require 'rails_helper'

RSpec.describe "services/edit", type: :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :name => "MyText",
      :description => "MyText",
      :is_folder => 1,
      :service_id => 1
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "textarea#service_name[name=?]", "service[name]"

      assert_select "textarea#service_description[name=?]", "service[description]"

      assert_select "input#service_is_folder[name=?]", "service[is_folder]"

      assert_select "input#service_service_id[name=?]", "service[service_id]"
    end
  end
end
