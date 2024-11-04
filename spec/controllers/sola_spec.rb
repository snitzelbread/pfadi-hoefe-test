require 'rails_helper'

RSpec.describe SolaController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      sola = create(:camp, name: 'Sommerlager')
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'loads the sola' do
      sola = create(:camp, name: 'Sommerlager')

      get :index

      expect(assigns(:sola)).to eq(sola)
    end

    it 'loads the title image' do
      sola = create(:camp, name: 'Sommerlager')
      sola.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      image = sola.images.first

      get :index

      expect(assigns(:title_image)).to eq(image)
    end
  end
end
