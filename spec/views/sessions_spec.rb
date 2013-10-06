require 'spec_helper'

describe "sessions/new" do

  it "renders _form for @form." do
    assign(:form, stub_model(SigninForm))
    render
    expect(view).to render_template(partial: "_form", count: 1)
  end

end
