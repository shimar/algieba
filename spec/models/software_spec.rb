# == Schema Information
#
# Table name: softwares
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string(255)
#  description    :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  measure_method :integer          default(0)
#

require 'spec_helper'

describe Software do

  describe :associations do

    before(:each) do
      @software = Software.new
    end

    describe :data_functions do
      it "has many of data_functions." do
        @software.respond_to?(:data_functions).should == true
      end
    end

    describe :ilfs do
      it "has many of ilfs." do
        @software.respond_to?(:ilfs).should == true
      end
    end

    describe :elfs do
      it "has many of elfs." do
        @software.respond_to?(:elfs).should == true
      end
    end

    describe :transactional_functions do
      it "has many of transactional_functions." do
        @software.respond_to?(:transactional_functions).should == true
      end
    end

    describe :eis do
      it "has many of eis." do
        @software.respond_to?(:eis).should == true
      end
    end

    describe :eos do
      it "has many of eos." do
        @software.respond_to?(:eos).should == true
      end
    end

    describe :eqs do
      it "has many of eqs." do
        @software.respond_to?(:eqs).should == true
      end
    end

    describe :vaf do
      it "has one of vaf." do
        @software.respond_to?(:vaf).should == true
      end
    end

  end

  describe :validations do

    before(:each) do
      @model = Software.new
    end

    describe :user_id do

      it "requires :user_id." do
        @model.name = 'test software.'
        @model.description = 'test description.'
        @model.valid?.should == false
        @model.errors.include?(:user_id).should == true
      end

    end

    describe :name do

      it "requires :name." do
        @model.user_id = 1
        @model.description = 'test description.'
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end

      it "allows the length of name less or equals 100 characters." do
        name = ''
        100.times { |i| name += 'a' }
        @model.user_id = 1
        @model.name = name
        @model.description = 'test description.'
        @model.valid?.should == true

        @model.name += 'a'
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end

      it "does not allows the duplicated name in user_id." do
        FactoryGirl.create(:software)
        @model.user_id = 1
        @model.name = 'test software name.'
        @model.description = 'test software description.'
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end

    end

    describe :description do

      it "allows the length of description less or equals 255 characters." do
        description = ''
        255.times { |i| description += 'a' }
        @model.user_id = 1
        @model.name = 'test software name.'
        @model.description = description
        @model.valid?.should == true

        @model.description += 'a'
        @model.valid?.should == false
        @model.errors.include?(:description).should == true
      end

    end

    describe :measure_method do
      it "requires :measure_method." do
        @model.measure_method = nil
        @model.valid?.should == false
        @model.errors.include?(:measure_method).should == true
      end

      it "should be 0 as default." do
        @model.valid?.should == false
        @model.measure_method.should == 0
        @model.errors.include?(:measure_method).should == nil
      end

      it "should be in values of @@measure_methods." do
        Software.measure_methods.each do |k, v|
          @model.measure_method = v
          @model.valid?.should == false
          @model.errors.include?(:measure_method).should == nil
        end
        @model.measure_method = 3
        @model.valid?.should == false
        @model.errors.include?(:measure_method).should == true
      end

    end

  end

  describe :data_function_points do
    before(:each) do
      @model = FactoryGirl.build(:software)
    end
    it "returns 0.0 when the software has no data_functions." do
      @model.data_function_points.should == 0
    end
    it "returns sum of the function points of ilfs and elfs." do
      ilf = @model.ilfs.build
      ilf.stub(:function_point).and_return 1
      elf = @model.elfs.build
      elf.stub(:function_point).and_return 2
      @model.data_function_points.should == 3
    end
  end

  describe :transactional_function_points do
    before(:each) do
      @model = FactoryGirl.build(:software)
    end
    it "returns 0.0 when the software has no transactional_functions." do
      @model.transactional_function_points.should == 0
    end
    it "returns sum of the function points of eis, eos, and eqs." do
      ei = @model.eis.build
      ei.stub(:function_point).and_return 1
      eo = @model.eos.build
      eo.stub(:function_point).and_return 2
      eq = @model.eqs.build
      eq.stub(:function_point).and_return 3
      @model.transactional_function_points.should == 6
    end
  end

  describe :unadjusted_function_points do
    before(:each) do
      @model = FactoryGirl.build :software
    end
    it "returns 0 when the software has no data_functions and transactional_functions." do
      @model.unadjusted_function_points.should == 0
    end
    it "returns sum of data function points and transactional function points." do
      @model.stub(:data_function_points).and_return 3
      @model.stub(:transactional_function_points).and_return 5
      @model.unadjusted_function_points.should == 8
    end
  end

  describe :measure_methods do

    it "returns the frozen hash of measure_methods." do
      Software.measure_methods.should be_an_instance_of Hash
      Software.measure_methods.frozen?.should == true
    end

  end

end
