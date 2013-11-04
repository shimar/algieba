require 'spec_helper'

describe "Session" do

  describe "GET /" do

    it "redirects /welcome." do
      visit root_path
      expect(page).to have_content 'Calculate software function points.'
    end

  end

  describe "Sign in", js: true do

    describe "when user clicks the signin button with no email address," do
      it "display the email field with error message." do
        visit root_path
        fill_in 'Password', with: 'password'
        click_button 'signin-button'
        find('div.signin_form_email div.controls span.text-danger').should have_content("can't be blank")
      end
    end

    describe "when user clicks the signin button with no password," do
      it "display the password field with error message." do
        visit root_path
        fill_in 'Email', with: 'test@test.com'
        click_button 'signin-button'
        find('div.signin_form_password div.controls span.text-danger').should have_content("can't be blank")
      end
    end

    describe "when user who have no accounts signs in," do
      it "display the welcome page with error message again." do
        visit root_path
        fill_in 'Email', with: 'unknown@test.com'
        fill_in 'Password', with: 'password'
        click_button 'signin-button'
        expect(page).to have_content 'incorrect email or password.'
      end
    end

    describe "when user who have an account signs in with invalid password," do
      it "display the welcome page with error message again." do
        visit root_path
        fill_in 'Email',    with: 'test@test.com'
        fill_in 'Password', with: 'invalid'
        click_button 'signin-button'
        expect(page).to have_content 'incorrect email or password.'
      end
    end

    describe "when user who have an account signs in," do
      before(:each) do
        FactoryGirl.create(:user)
      end
      it "display the list of softwares." do
        visit root_path
        fill_in 'Email',    with: 'test@test.com'
        fill_in 'Password', with: 'password'
        click_button 'signin-button'
        expect(page).to have_content "test@test.com's softwares."
      end
    end
  end

end
