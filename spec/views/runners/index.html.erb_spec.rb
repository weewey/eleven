require 'rails_helper'

RSpec.describe "runners/index", type: :view do
  before(:each) do
    assign(:runners, [
      Runner.create!(),
      Runner.create!()
    ])
  end

  it "renders a list of runners" do
    render
  end
end
