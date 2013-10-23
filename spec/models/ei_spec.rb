# == Schema Information
#
# Table name: transactional_functions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  software_id  :integer
#  name         :string(255)
#  type         :string(255)
#  det          :integer
#  ftr          :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#

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
