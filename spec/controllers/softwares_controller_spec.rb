require 'spec_helper'

describe SoftwaresController do

  describe :index do
  end

  describe :show do
  end

  describe :new do

    context 'when user not signed in,' do
      it "redirects to welcome_url." do
        get :new
        expect(response).to redirect_to welcome_url
      end
    end

    context 'when user signed in,' do

      it "assigns new instance of Software owned by user." do
        user = FactoryGirl.create(:user)
        get :new, {}, { user_id: user.id }
        assigns(:software).should be_a_new Software
        assigns(:software).user_id.should == user.id
      end

      it "renders 'new.html.erb'." do
        user = FactoryGirl.create(:user)
        get :new, {}, { user_id: user.id }
        expect(response).to render_template(:new)
      end

    end

  end

  describe :edit do
  end

  describe :create do
  end

  describe :update do
  end

  describe :destroy do
  end

end
