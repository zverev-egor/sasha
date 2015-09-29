require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :fio => "Fio",
        :number => "Number"
      ),
      Record.create!(
        :fio => "Fio",
        :number => "Number"
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => "Fio".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
