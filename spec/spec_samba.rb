require 'spec_helper'

describe SambaApi::Projects do
  it "Should Be pass" do
    expect(SambaApi::Projects.greet).to eq("Hello World") 
  end
end