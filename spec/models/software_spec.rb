require 'spec_helper'

describe Software do

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

  end

end
