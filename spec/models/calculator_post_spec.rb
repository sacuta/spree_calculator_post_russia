require File.dirname(__FILE__) + '/../spec_helper'

describe CalculatorPost do
  before(:each) do
    @calculator_post = CalculatorPost.new
  end

  it "should be valid" do
    @calculator_post.should be_valid
  end
end
