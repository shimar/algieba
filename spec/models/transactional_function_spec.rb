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

  describe :complexity do
    before(:each) do
      @model = TransactionalFunction.new
    end

    it "returns :low when the det is less than 5 and the ftr is less than 2." do
      @model.det = 4
      @model.ftr = 1
      @model.complexity.should == :low
    end

    it "returns :low when the det is less than 16 and the ftr is less than 2." do
      @model.det = 15
      @model.ftr = 1
      @model.complexity.should == :low
    end

    it "returns :average when the det is greater than or equals to 16 and the ret is less than 2." do
      @model.det = 16
      @model.ftr = 1
      @model.complexity.should == :average
    end

    it "returns :low when the det is less than 5 and the ftr is equals to 2." do
      @model.det = 4
      @model.ftr = 2
      @model.complexity.should == :low
    end

    it "returns :average when the det is less than 16 and the ftr is equals to 2." do
      @model.det = 15
      @model.ftr = 2
      @model.complexity.should == :average
    end

    it "returns :high when the det is greater than or equals to 16 and the ftr is equals to 2." do
      @model.det = 16
      @model.ftr = 2
      @model.complexity.should == :high
    end

    it "returns :average when the det is less than 5 and the ftr is greater than or equals to 3." do
      @model.det = 4
      @model.ftr = 3
      @model.complexity.should == :average
    end

    it "returns :high when the det is less than 16 and the ftr is greater than or equals to 3." do
      @model.det = 15
      @model.ftr = 3
      @model.complexity.should == :high
    end

    it "returns :high when the det is greater than or equals to 16 and the ftr is greater than or equals to 3." do
      @model.det = 16
      @model.ftr = 3
      @model.complexity.should == :high
    end
  end

end
