require 'spec_helper'

describe ApplicationController do

  controller do
    def index
      redirect_to root_url
    end
  end

  describe :auth_filter do
    it "redirects to welcome_url if a user not authenticated." do
      get :index
      response.should redirect_to(welcome_url)
    end

    it "does not filter the action if a user authenticated." do
      get :index, {}, { user_id: 1 }
      response.should redirect_to(root_url)
    end
  end

  describe :authenticated? do

    it "returns false if not the session[:user_id] is nil." do
      @controller.send(:authenticated?).should == false
      session[:user_id] = 1
      @controller.send(:authenticated?).should == true
    end

  end

end
