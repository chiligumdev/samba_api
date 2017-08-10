require 'spec_helper'

describe SambaApi::Projects do
  it "Should Be pass" do
    expect(SambaApi::Projects.greet).to eq("hello world") 
  end
end