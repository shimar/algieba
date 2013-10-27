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

      it "assings new instance of Vaf associated assigned software." do
        user = FactoryGirl.create(:user)
        get :new, {}, { user_id: user.id }
        assigns(:vaf).should be_a_new Vaf
        assigns(:vaf).user_id.should == user.id
      end

      it "renders 'new.html.erb'." do
        user = FactoryGirl.create(:user)
        get :new, {}, { user_id: user.id }
        expect(response).to render_template(:new)
      end

    end

  end

  describe :edit do

    context 'when user not signed in,' do
      it "redirects to welcome url." do
        get :edit, { id: 1 }
        expect(response).to redirect_to welcome_url
      end
    end

    context 'when user signed in,' do
      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      context 'and the user found,' do

        context 'and the software found,' do

          before(:each) do
            @software = FactoryGirl.create(:software)
          end

          it "assigns the signed user to @user." do
            get :edit, { user_id: '1', id: '1' }, { user_id: '1' }
            assigns(:user).should == @user
          end

          it "assigns the software has given id to @software." do
            get :edit, { user_id: '1', id: '1' }, { user_id: '1' }
            assigns(:software).should == @software
          end

        end

        context 'and the software not found,'
      end
    end

  end

  describe :create do

    context "when user not signed in," do
      it "redirects to welcome url." do
        post :create
        expect(response).to redirect_to welcome_url
      end
    end

    context "when user signed in," do

      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      it "assigns the current user to @user." do
        post :create, { software: { name: 'test name', description: 'test desc'} }, { user_id: @user }
        assigns(:user).should == @user
      end

      it "assigns the software built from parameters owned the current user to @software." do
        post :create, { software: { name: 'test name', description: 'test desc'} }, { user_id: @user }
        assigns(:software).should be_an_instance_of Software
        assigns(:software).user_id.should == @user.id
        assigns(:software).name.should == 'test name'
        assigns(:software).description.should == 'test desc'
      end

      context "and the parameters not valid," do
        it "renders 'new' if failed to save the software." do
          post :create, { software: { name: '', description: 'test desc'} }, { user_id: @user }
          expect(response).to render_template(:new)
        end
      end
      context "and the parameters valid," do
        it "creates a new record to the software table." do
          lambda {
            post :create, { software: { name: 'test name', description: 'test desc'} }, { user_id: @user }
          }.should change(Software, :count).by(1)
        end
        it "redirects to root url." do
          post :create, { software: { name: 'test name', description: 'test desc'} }, { user_id: @user }
          expect(response).to redirect_to root_url
        end
      end
    end

  end

  describe :update do
  end

  describe :destroy do
  end

end
