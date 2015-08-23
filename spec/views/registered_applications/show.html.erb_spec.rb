require 'rails_helper'

RSpec.describe "registered_applications/show", type: :view do
  before(:each) do
    @registered_application = assign(:registered_application, RegisteredApplication.create!(
      :name => "Name",
      :url => "Url",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
