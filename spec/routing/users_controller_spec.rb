require 'spec_helper'

describe UsersController do

  it "routes get / to users#top" do
    expect(get: '/').to route_to(controller: 'users',
                                 action: 'top')
  end

  it "routes get /users to users#index" do
    expect(get: '/users').to route_to(controller: 'users',
                                      action: 'index')
  end

  it "routes get /users/:id to users#show" do
    expect(get: '/users/1').to route_to(controller: 'users',
                                        action: 'show',
                                        id: '1')
  end

  it "routes get /users/new to users#new" do
    expect(get: '/users/new').to route_to(controller: 'users',
                                          action: 'new')
  end

  it "routes post /users to users#create" do
    expect(post: '/users').to route_to(controller: 'users',
                                       action: 'create')
  end

  it "routes patch or put /users/:id to users#create" do
    expect(patch: '/users/1').to route_to(controller: 'users',
                                          action: 'update',
                                          id: '1')
    expect(put: '/users/1').to route_to(controller: 'users',
                                        action: 'update',
                                        id: '1')
  end

  it "routes delete /users/:id to users#destroy" do
    expect(delete: '/users/1').to route_to(controller: 'users',
                                           action: 'destroy',
                                           id: '1')
  end

end
