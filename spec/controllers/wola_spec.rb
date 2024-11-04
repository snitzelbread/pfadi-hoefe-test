require 'rails_helper'

RSpec.describe WolaController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      wola = create(:camp, name: 'Wochenlager')
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'loads the wola' do
      wola = create(:camp, name: 'Wochenlager')

      get :index

      expect(assigns(:wola)).to eq(wola)
    end

    it 'loads the title image' do
      wola = create(:camp, name: 'Wochenlager')
      wola.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      image = wola.images.first

      get :index

      expect(assigns(:title_image)).to eq(image)
    end
  end
end
