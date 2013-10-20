# -*- coding: utf-8 -*-
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

  describe :complexity do
    before(:each) do
      @model = DataFunction.new
    end

    it "returns :low when the det is less than 20 and the ret is less than 2." do
      @model.det = 19
      @model.ret = 1
      @model.complexity.should == :low
    end

    it "returns :low when the det is less than 51 and the ret is less than 2." do
      @model.det = 50
      @model.ret = 1
      @model.complexity.should == :low
    end

    it "returns :average when the det is greater than or equals to 51 and the ret is less than 2." do
      @model.det = 51
      @model.ret = 1
      @model.complexity.should == :average
    end

    it "returns :low when the det is less than 20 and the ret is 2〜5." do
      @model.det = 19
      @model.ret = 2
      @model.complexity.should == :low
      @model.det = 19
      @model.ret = 5
      @model.complexity.should == :low
    end

    it "returns :average when the det is 20〜50 and the ret is 2〜5." do
      @model.det = 20
      @model.ret = 2
      @model.complexity.should == :average
      @model.det = 20
      @model.ret = 5
      @model.complexity.should == :average
      @model.det = 50
      @model.ret = 2
      @model.complexity.should == :average
      @model.det = 50
      @model.ret = 5
      @model.complexity.should == :average
    end

    it "returns :high when the det is greater than or equals to 51 and the ret is 2〜5." do
      @model.det = 51
      @model.ret = 2
      @model.complexity.should == :high
      @model.det = 51
      @model.ret = 5
      @model.complexity.should == :high
    end

    it "returns :average when the det is less than 20 and the ret is greater than or equals to 6." do
      @model.det = 19
      @model.ret = 6
      @model.complexity.should == :average
    end

    it "returns :high when the det is 20〜50 and the ret is greater than or equals to 6." do
      @model.det = 20
      @model.ret = 6
      @model.complexity.should == :high
      @model.det = 50
      @model.ret = 6
      @model.complexity.should == :high
    end

    it "returns :high when the det is greater than or equals to 51 and the ret is greater than or equals to 6." do
      @model.det = 51
      @model.ret = 6
      @model.complexity.should == :high
    end

  end

end
