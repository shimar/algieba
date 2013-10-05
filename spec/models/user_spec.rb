require 'spec_helper'

describe User do

  describe :validations do

    before(:each) do
      @user = User.new
    end

    describe :email do
      it "requires email." do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?.should == false
        @user.errors.include?(:email).should == true
      end
    end

    describe :password do
      it "requires password_digest." do
        @user.email = 'email@test.com'
        @user.valid?.should == false
        @user.errors.include?(:password).should == true
      end

      it "validates that password_digest must be same to password_confirmation." do
        @user.email = 'email@test.com'
        @user.password = 'password'
        @user.valid?.should == false
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?.should == true
      end
    end

  end

  describe :secure_password do
    before(:each) do
      @user = User.new
    end

    it "has an attribute for password_digest." do
      @user.respond_to?(:password_digest).should == true
    end

    it "has an attribute for password." do
      @user.respond_to?(:password).should == true
    end

    it "has an attribute for password_confirmation." do
      @user.respond_to?(:password_confirmation).should == true
    end

    it "has authenticate method." do
      @user.respond_to?(:authenticate).should == true
    end

  end

end
