require 'rails_helper'

RSpec.describe "runners/edit", type: :view do
  before(:each) do
    @runner = assign(:runner, Runner.create!())
  end

  it "renders the edit runner form" do
    render

    assert_select "form[action=?][method=?]", runner_path(@runner), "post" do
    end
  end
end
