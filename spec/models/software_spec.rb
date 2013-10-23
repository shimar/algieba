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
      it "requires :measure_method."
    end

  end


  describe :measure_methods do

    it "returns the frozen hash of measure_methods." do
      Software.measure_methods.should be_an_instance_of Hash
      Software.measure_methods.frozen?.should == true
    end

  end

end
