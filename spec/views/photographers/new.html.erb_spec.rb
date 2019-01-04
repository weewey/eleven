require 'rails_helper'

RSpec.describe "photographers/new", type: :view do
  before(:each) do
    assign(:photographer, Photographer.new())
  end

  it "renders new photographer form" do
    render

    assert_select "form[action=?][method=?]", photographers_path, "post" do
    end
  end
end
