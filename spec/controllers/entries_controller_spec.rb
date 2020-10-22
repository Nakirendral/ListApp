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
  end
end
