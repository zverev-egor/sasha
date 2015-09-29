require 'rails_helper'

RSpec.describe "records/edit", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :fio => "MyString",
      :number => "MyString"
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_fio[name=?]", "record[fio]"

      assert_select "input#record_number[name=?]", "record[number]"
    end
  end
end
