require 'spec_helper'

describe SigninForm do

  describe :validations do

    before(:each) do
      @model = SigninForm.new
    end

    describe :email do
      it "requires email address." do
        @model.password = 'test'
        @model.valid?.should == false
        @model.errors.include?(:email).should == true
      end
    end

    describe :password do
      it "requires password." do
        @model.email = 'email@test.com'
        @model.valid?.should == false
        @model.errors.include?(:password).should == true
      end
    end

  end

end
