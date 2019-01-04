require 'rails_helper'

RSpec.describe "photographers/show", type: :view do
  before(:each) do
    @photographer = assign(:photographer, Photographer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
