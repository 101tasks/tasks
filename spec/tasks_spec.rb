# encoding: utf-8

require_relative "spec_helper"

describe Tasks do
  it "should have VERSION constant" do
    Tasks::VERSION.should be_kind_of(String)
    Tasks::VERSION.should match(/^\d+\.\d+\.\d+$/)
  end
end
