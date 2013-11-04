require 'spec_helper'

describe "Session" do

  describe "Sing up" do
    describe "when a user clicks the button of 'Sign up for algieba now!'," do
      it "display the signup form." do
        visit root_path
        click_link 'signup-button'
        expect(page).to have_content 'Sing Up'
      end
    end

    describe "when a user click the back button," do
      it "display the welcome page." do
        visit root_path
        click_link 'signup-button'
        click_link 'Back'
        expect(page).to have_content 'Calculate software function points.'
      end
    end

    describe "when a user click the signup button with no inputs," do
      before(:each) do
        visit root_path
        click_link 'signup-button'
        click_button 'signup-button'
      end
      it "display the signup form again." do
        expect(page).to have_content 'Sign Up'
      end

      it "display the email field with error message." do
        find('div.user_email span.text-danger').should have_content("can't be blank")
      end
      it "display the password field with error message." do
        find('div.user_password span.text-danger').should have_content("can't be blank")
      end
      it "display the password confirmation field with error message." do
        find('div.user_password_confirmation span.text-danger').should have_content("doesn't match Password")
      end
    end
  end

  describe "when a user fills the form that email has been used by other, and clicks the signin button," do
    before(:each) do
      FactoryGirl.create(:user)
      visit root_path
      click_link 'signup-button'
    end

    it "display the signup form again." do
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_email_confirmation', with: 'test@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'signup-button'
      expect(page).to have_content('Sign Up')
    end

    it "display the email field with error message." do
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_email_confirmation', with: 'test@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'signup-button'
      find('div.user_email span.text-danger').should have_content('has already been taken')
    end

  end

  describe "when a user fills the form and clicks the signin button," do
    before(:each) do
      visit root_path
      click_link 'signup-button'
      click_button 'signup-button'
    end

    it "display the list of software page." do
      fill_in 'user_email', with: 'john@test.com'
      fill_in 'user_email_confirmation', with: 'john@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'signup-button'
      expect(page).to have_content "john@test.com's softwares."
    end
  end

  describe "Sign in" do

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
