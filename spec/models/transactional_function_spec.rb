require 'spec_helper'

describe TransactionalFunction do

  describe :associations do

    before(:each) do
      @model = TransactionalFunction.new
    end

    it "belongs to a software." do
      @model.respond_to?(:software).should == true
    end

  end

end
