require 'spec_helper'

describe DataFunction do

  describe :associations do
    before(:each) do
      @model = DataFunction.new
    end
    it "belongs to a software." do
      @model.respond_to?(:software).should == true
    end
  end

end
