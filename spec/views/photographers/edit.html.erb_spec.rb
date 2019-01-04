require 'rails_helper'

RSpec.describe "photographers/edit", type: :view do
  before(:each) do
    @photographer = assign(:photographer, Photographer.create!())
  end

  it "renders the edit photographer form" do
    render

    assert_select "form[action=?][method=?]", photographer_path(@photographer), "post" do
    end
  end
end
