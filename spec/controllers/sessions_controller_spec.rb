require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  it "Should render the new template" do

    get :new

    expect(response).to render_template(:new)
  end

  it "New - Should assign new user for the login form" do
    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  it " Should login user with correct user name and password" do
    FactoryGirl.create :valid_user
    post :create, user: FactoryGirl.attributes_for(:valid_user)

    expect(response).to redirect_to(home_path)

  end

end
