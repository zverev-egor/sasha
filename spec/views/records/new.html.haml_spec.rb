require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new(
      :fio => "MyString",
      :number => "MyString"
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_fio[name=?]", "record[fio]"

      assert_select "input#record_number[name=?]", "record[number]"
    end
  end
end
