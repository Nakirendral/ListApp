require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe '#index' do
    it { is_expected.to respond_with :ok }
  end
end
