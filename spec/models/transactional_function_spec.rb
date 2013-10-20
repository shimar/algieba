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

  describe :validations do
    before(:each) do
      @model = TransactionalFunction.new
    end

    describe :user_id do
      it "requires :user_id." do
        @model.valid?.should == false
        @model.errors.include?(:user_id).should == true
        @model.user_id = 1
        @model.valid?.should == false
        @model.errors.include?(:user_id).should == nil
      end
    end

    describe :software_id do
      it "requires software_id." do
        @model.valid?.should == false
        @model.errors.include?(:software_id).should == true
        @model.software_id = 1
        @model.valid?.should == false
        @model.errors.include?(:software_id).should == nil
      end
    end

    describe :name do
      it "requires :name." do
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end
      it "allows less than or equals 255 chars as name." do
        name = ''
        255.times { name += 'a' }
        @model.name = name
        @model.valid?.should == false
        @model.errors.include?(:name).should == nil
        @model.name += 'a'
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end
    end

    describe :type do
      it "requires :type." do
        @model.valid?.should == false
        @model.errors.include?(:type).should == true
        @model.type = 'Ei'
        @model.valid?.should == false
        @model.errors.include?(:type).should == nil
      end
    end

    describe :det do
      it "allows only greater than or equals to 0." do
        @model.valid?.should == false
        @model.errors.include?(:det).should == true
        @model.det = -1
        @model.valid?.should == false
        @model.errors.include?(:det).should == true
        @model.det = 0
        @model.valid?.should == false
        @model.errors.include?(:det).should == nil
      end
      it "allows only integer." do
        @model.det = 0.1
        @model.valid?.should == false
        @model.errors.include?(:det).should == true
      end
    end

    describe :ftr do
      it "allows only greater than or equals to 0." do
        @model.valid?.should == false
        @model.errors.include?(:ftr).should == true
        @model.ftr = -1
        @model.valid?.should == false
        @model.errors.include?(:ftr).should == true
        @model.ftr = 0
        @model.valid?.should == false
        @model.errors.include?(:ftr).should == nil
      end
      it "allows only integer." do
        @model.ftr = 0.1
        @model.valid?.should == false
        @model.errors.include?(:ftr).should == true
      end
    end
  end

end
