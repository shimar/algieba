require 'spec_helper'

describe 'users/top' do

  before(:each) do
    @user = FactoryGirl.create(:user)
    view.stub(:current_user).and_return @user
  end

  it "renders 'top' template." do
    assign(:softwares, [])
    render
    expect(response).to render_template('top')
  end

  it "displays the header with email of current_user." do
    assign(:softwares, [])
    render
    expect(rendered).to include("test@test.com's softwares.")
  end

  it "displays a button to create new software." do
    assign(:softwares, [])
    render
    expect(rendered).to include("New software.")
  end

  context 'when @user has any softwares,' do
    it "does not render softwares/_software template. " do
      assign(:softwares, [])
      render
      expect(view).to render_template(partial: 'softwares/_software', count: 0)
    end
  end

  context 'when @user has at least one software,' do
    it "renders softwares/_software template. "
  end

end

describe 'users/new' do

  it "renders 'new' template." do
    assign(:user, stub_model(User))
    render
    expect(view).to render_template('new')
  end

  it "renders _form for @user." do
    assign(:user, stub_model(User))
    render
    expect(view).to render_template(partial: '_form', count: 1)
  end

end
