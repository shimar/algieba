require 'spec_helper'

describe Elf do

  describe :function_point do
    before(:each) do
      @model = Elf.new
    end

    context "when its complexity is :low," do
      it "returns 5 as a function point." do
        @model.stub(:complexity).and_return :low
        @model.function_point.should == 5
      end
    end

    context "when its complexity is :average," do
      it "returns 7 as a function point." do
        @model.stub(:complexity).and_return :average
        @model.function_point.should == 7
      end
    end

    context "when its complexity is :high," do
      it "returns 10 as a function point." do
        @model.stub(:complexity).and_return :high
        @model.function_point.should == 10
      end
    end

  end

end
