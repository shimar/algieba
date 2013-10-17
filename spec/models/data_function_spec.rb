# == Schema Information
#
# Table name: data_functions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  software_id  :integer
#  type         :string(255)
#  det          :integer
#  ret          :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#  name         :string(255)
#

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

  describe :validations do

    before(:each) do
      @model = DataFunction.new
    end

    describe :user_id do
      it "requires :user_id." do
        @model.valid?.should == false
        @model.errors.include?(:user_id).should == true
      end
    end

    describe :software_id do
      it "requires :software_id." do
        @model.valid?.should == false
        @model.errors.include?(:software_id).should == true
      end
    end

    describe :type do
      it "requires :type." do
        @model.valid?.should == false
        @model.errors.include?(:type).should == true
      end
    end

    describe :name do
      it "requires :name." do
        @model.valid?.should == false
        @model.errors.include?(:name).should == true
      end

      it "allows less than or equals 255 characters for name." do
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

  end

end
