require 'spec_helper'

describe SessionsController do

  describe :new do
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

end
