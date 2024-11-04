require 'rails_helper'

RSpec.describe PfilaController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      pfila = create(:camp, name: 'Pfingstlager')
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'loads the wola' do
      pfila = create(:camp, name: 'Pfingstlager')

      get :index

      expect(assigns(:pfila)).to eq(pfila)
    end

    it 'loads the title image' do
      pfila = create(:camp, name: 'Pfingstlager')
      pfila.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      image = pfila.images.first

      get :index

      expect(assigns(:title_image)).to eq(image)
    end
  end
end
