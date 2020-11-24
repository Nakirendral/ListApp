require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  describe 'GET #index' do
    it "renders the index template" do
      user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
      list = List.create!(id: 1, title: "heyo", user: user)
      entry = Entry.create!(id: 1, content: "heyo", score: 1, list_id: 1)
      get :index, params: {list_id: 1, entry: [id: 1, content: "heyo", score: 1, list_id: 1]}
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

    it "returns nil when finding a list that does not exist" do
      user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
      list = List.create!(id: 2, title: "heyo", user: user)
      get :show, params: {list_id: 1, id: 1}
      expect(List.find_by_id(1)).to be_nil
    end
  end

  describe 'POST #create' do
    it "creates an entry based on simple_form input" do
      user = User.create!(id: 1, username: "Squid", email: "s@s.com", first_name: "Sid", last_name: "Monty")
      list = List.create!(id: 2, title: "heyo", user: user)
      post :create, params: {content: "hey", list_id: 2, score: 20, id: 1}
      expect(response).to render_template("show")
    end
  end
end