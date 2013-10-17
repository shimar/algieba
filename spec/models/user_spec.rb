# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do

  describe :associations do
    before(:each) do
      @user = User.new
    end

    it "has many of softwares" do
      @user.respond_to?(:softwares).should == true
    end

  end

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

      it "should be unique." do
        FactoryGirl.create :user
        @user.email = 'test@test.com'
        @user.email_confirmation = 'test@test.com'
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?.should == false
        @user.errors.include?(:email).should == true
      end

      it "should be matched to email_confirmation." do
        @user.email = 'test@test.com'
        @user.email_confirmation = 'not_matched@test.com'
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?.should == false
        @user.errors.include?(:email_confirmation).should == true
      end
    end

    describe :password do
      it "requires password." do
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
