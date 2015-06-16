require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  #render_views

  it "should return index view for index method" do

    get :index

    expect(response).to render_template(:index)
  end

  it "new creates a new user" do
    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  it "It renders the new page" do

    get :new

    expect(response).to render_template(:new)

  end

  it "Allows creation of a valid user, redirects correctly" do
   post :create, user: FactoryGirl.attributes_for(:valid_user)

   expect(response).to redirect_to(users_path)

  end

  it "Should not login user with incorrect user name and password" do
    post :create, user: FactoryGirl.attributes_for(:null_email)

    expect(response).to redirect_to(new_user_path)

  end


end
