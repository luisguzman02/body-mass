require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'index' do
    before do
      get :index
    end
    it 'renders :index' do
      expect(response).to render_template(:index)
    end
  end
end
