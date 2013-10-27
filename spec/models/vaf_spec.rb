require 'spec_helper'

describe Vaf do

  describe :associations do

    before(:each) do
      @model = Vaf.new
    end

    it "belongs to a software." do
      @model.respond_to?(:software).should == true
    end

  end

end
