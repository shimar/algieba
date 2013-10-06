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

  describe :find_user do

    it "returns an User object which has same email to self." do
      expected = FactoryGirl.create(:user)
      @model = SigninForm.new({email: 'test@test.com'})
      user = @model.find_user
      user.should == expected
    end

    it "returns nil if the no user has the email address." do
      @model = SigninForm.new({email: 'notfound@test.com'})
      @model.find_user.should == nil
    end

  end

end
