require 'spec_helper'

describe SessionsController do

  it "routes /welcome to sessions#new" do
    expect(get: '/welcome').to route_to(controller: 'sessions',
                                        action: 'new')
  end
  it "routes /signin to sessions#create" do
    expect(post: '/signin').to route_to(controller: 'sessions',
                                        action: 'create')
  end
  it "routes /singout to sessions#destroy" do
    expect(delete: '/signout').to route_to(controller: 'sessions',
                                           action: 'destroy')
  end

end
