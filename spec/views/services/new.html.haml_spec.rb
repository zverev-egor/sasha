require 'rails_helper'

RSpec.describe "services/new", type: :view do
  before(:each) do
    assign(:service, Service.new(
      :name => "MyText",
      :description => "MyText",
      :is_folder => 1,
      :service_id => 1
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "textarea#service_name[name=?]", "service[name]"

      assert_select "textarea#service_description[name=?]", "service[description]"

      assert_select "input#service_is_folder[name=?]", "service[is_folder]"

      assert_select "input#service_service_id[name=?]", "service[service_id]"
    end
  end
end
