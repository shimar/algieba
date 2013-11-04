require 'spec_helper'

describe UsersController do

  describe :top do
    context "when user not authenticated," do
      it "redirects to welcome_url." do
        get :top
        expect(response).to redirect_to welcome_url
      end
    end

    context "when user authenticated," do

      before(:each) do
        @user = FactoryGirl.create(:user)
      end

      it "assigns the instance of authenticated user to @user." do
        session[:user_id] = @user.id
        get :top
        assigns(:user).should == @user
      end

      it "assings the objects of Software owned by @user." do
        session[:user_id] = @user.id
        get :top
        assigns(:softwares).should == @user.softwares
      end

      it "assigns the objects of Software includes ILFs, ELFs, EIs, EOs, and EQs." do
        user = double(:user)
        software = double(:software)
        software.stub(:includes).and_return(true)
        @controller.stub(:current_user).and_return(user)
        user.stub(:softwares).and_return(software)
        software.should_receive(:includes).with(:ilfs,:elfs, :eis, :eos, :eqs)

        session[:user_id] = @user.id
        get :top
      end

      it "renders :top." do
        session[:user_id] = @user.id
        get :top
        expect(response).to render_template :top
      end

    end

  end

  describe :index do
  end

  describe :show do
  end

  describe :new do

    it "assigns new instance of User to @user." do
      get :new
      assigns(:user).should be_a_new User
    end

    it "renders 'new.html.erb." do
      get :new
      expect(response).to render_template(:new)
    end

    it "returns 200 as http status." do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end

  describe :edit do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "assigns current user object to @user." do
      get :edit, {id: '1'}, {user_id: '1'}
      assigns(:user).should == @user
    end

    it "renders 'edit.html.erb'." do
      get :edit, {id: '1'}, {user_id: '1'}
      expect(response).to render_template(:edit)
    end

    it "returns 200 as http status." do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end

  describe :create do

    it "assigns aninstance of User with given parameters." do
      user_params = {
        email:              'test@test.com',
        email_confirmation: 'test@test.com',
        password:              'password',
        password_confirmation: 'password'
      }
      post :create, { user: user_params }
      assigns(:user).should be_instance_of User
      assigns(:user).email.should                 == 'test@test.com'
      assigns(:user).email_confirmation.should    == 'test@test.com'
      assigns(:user).password.should              == 'password'
      assigns(:user).password_confirmation.should == 'password'
    end

    context "when invalid parameters posted," do
      it "renders :new." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: '',
          password:              'password',
          password_confirmation: ''
        }
        post :create, { user: user_params }
        expect(response).to render_template(:new)
      end
    end

    context "when valid parameters posted," do
      it "creates a record of User." do
        lambda {
          user_params = {
            email:              'test@test.com',
            email_confirmation: 'test@test.com',
            password:              'password',
            password_confirmation: 'password'
          }
          post :create, { user: user_params }
        }.should change(User, :count).by(1)
      end

      it "redirects to root_url." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: 'test@test.com',
          password:              'password',
          password_confirmation: 'password'
        }
        post :create, { user: user_params }
        expect(response).to redirect_to(root_url)
      end

      it "fills the sesssion[:user_id] with the id of user created." do
        user_params = {
          email:              'test@test.com',
          email_confirmation: 'test@test.com',
          password:              'password',
          password_confirmation: 'password'
        }
        post :create, { user: user_params }
        expect(session[:user_id]).to eq(assigns(:user).id)
      end
    end

  end

  describe :update do
    pending
  end

  describe :destroy do
    pending
  end

end
