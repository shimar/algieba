class SessionsController < ApplicationController

  # GET /
  def new
    @form = SigninForm.new
  end

  # POST /signin
  def create
    @form = SigninForm.new(signin_params)
    if @form.valid?
      @user = @form.find_user
      if @user && @user.authenticate(@form.password)
        # TODO - redirect to users' top page.
      else
        flash.now[:error] = 'incorrect email or password.'
        render :new
      end
    else
      render :new
    end
  end

  def destroy
  end

  private

  def signin_params
    params.require(:signin_form).permit(:email, :password)
  end

end
