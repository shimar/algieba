require 'spec_helper'

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
