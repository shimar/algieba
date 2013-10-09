require 'spec_helper'

describe SessionsController do

  describe :new do
    it "redirects to user_softwares_url with session[:user_id] if authenticated." do
      get :new, {}, { user_id: 1 }
      expect(response).to redirect_to user_softwares_url(user_id: 1)
    end

    it "assigns new instance of SigninForm to @form." do
      get :new
      assigns(:form).should be_an_instance_of SigninForm
    end

    it "returns 200 as http status." do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe :create do
    it "assigns given parameters to @form."
    context "when @form valid," do
      context "and user has given email not found," do
        it "sets error message to flash[:error] and renders :new." do
          FactoryGirl.create(:user)
          post :create, signin_form: { email: 'notfound@test.com', password: 'password'}
          flash[:error].should == 'incorrect email or password.'
          expect(response).to render_template(:new)
        end
      end
      context "and user has given email found," do
        before(:each) do
          @expected = FactoryGirl.create(:user)
        end

        it "assigns the user to @user." do
          post :create, signin_form: { email: 'test@test.com', password: 'password'}
          assigns(:user).should == @expected
        end

        it "redirects to xxxxx if user authenticated."

        it "sets error message to flash[:error] and renders :new if user not authenticated." do
          post :create, signin_form: { email: 'test@test.com', password: 'not matched'}
          flash[:error].should == 'incorrect email or password.'
          expect(response).to render_template(:new)
        end

      end
    end

    context "when @form invalid," do
      it "renders :new." do
        post :create, signin_form: { email: '', password: ''}
        expect(response).to render_template(:new)
      end
    end
  end

end
