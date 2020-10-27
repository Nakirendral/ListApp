require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  describe 'GET #index' do
    it "renders the index template" do
      get :index, params: {list_id: 1}
      expect(response).to render_template("index")
    end
  end
  
  describe 'GET #show' do
    it "renders the show template" do
      get :show, params: {list_id: 1, id: 1}
      expect(response).to render_template('show')
    end

    it "returns a list with corresponding list_id" do
      user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
      list = List.create!(id: 2, title: "heyo", user: user)
      get :show, params: {list_id: list.id, id: 1}
      expect(assigns(:list)).to eq(list)
    end

    it "does not return a list with a different list_id" do
      user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
      list = List.create!(id: 2, title: "heyo", user: user)
      get :show, params: {list_id: 1, id: 1}
      expect(assigns(:list)).not_to eq(list)
    end

    describe 'POST #create' do
      it "creates an entry based on simple_form input" do
        user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
        list = List.create!(id: 2, title: "heyo", user: user)
        post :create, params: {}
      
  end
end
