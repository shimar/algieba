require 'spec_helper'

describe Ei do

  describe :function_point do
    before(:each) do
      @model = Ei.new
    end

    context "when its complexity is :low," do
      it "returns 3 as a function point." do
        @model.stub(:complexity).and_return :low
        @model.function_point.should == 3
      end
    end

    context "when its complexity is :average," do
      it "returns 4 as a function point." do
        @model.stub(:complexity).and_return :average
        @model.function_point.should == 4
      end
    end

    context "when its complexity is :high," do
      it "returns 6 as a function piont." do
        @model.stub(:complexity).and_return :high
        @model.function_point.should == 6
      end
    end

  end

end
