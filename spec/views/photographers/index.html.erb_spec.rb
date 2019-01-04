require 'rails_helper'

RSpec.describe "photographers/index", type: :view do
  before(:each) do
    assign(:photographers, [
      Photographer.create!(),
      Photographer.create!()
    ])
  end

  it "renders a list of photographers" do
    render
  end
end
