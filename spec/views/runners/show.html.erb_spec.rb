require 'rails_helper'

RSpec.describe "runners/show", type: :view do
  before(:each) do
    @runner = assign(:runner, Runner.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
