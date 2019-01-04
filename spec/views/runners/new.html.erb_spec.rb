require 'rails_helper'

RSpec.describe "runners/new", type: :view do
  before(:each) do
    assign(:runner, Runner.new())
  end

  it "renders new runner form" do
    render

    assert_select "form[action=?][method=?]", runners_path, "post" do
    end
  end
end
