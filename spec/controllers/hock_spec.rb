# spec/controllers/hocks_controller_spec.rb
require 'rails_helper'

RSpec.describe HocksController, type: :controller do
  render_views

  before do
    leader = create(:leader)
    sign_in leader
  end


  describe '#index' do
    subject(:request) { get :index }

    it 'assigns @biber_hocks, @woelfli_hocks, and @pfadi_hocks' do
      biber_hock = create(:hock, stufe: "Biber")
      woelfli_hock = create(:hock, stufe: "Wölfli")
      pfadi_hock = create(:hock, stufe: "Pfadi")

      request

      expect(response.body).to include(biber_hock.title)
      expect(response.body).to include(woelfli_hock.title)
      expect(response.body).to include(pfadi_hock.title)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'responds to JSON' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe '#new' do
    it 'assigns a new Hock to @hock' do
      get :new
      expect(assigns(:hock)).to be_a_new(Hock)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'creates a new Hock' do
        expect { post :create, params: { hock: FactoryBot.attributes_for(:hock) } }.to change(Hock, :count).by(1)
      end

      it 'redirects to the hocks index' do
        post :create, params: { hock: FactoryBot.attributes_for(:hock) }
        expect(response).to redirect_to(hocks_url)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Hock' do
        expect { post :create, params: { hock: FactoryBot.attributes_for(:hock, title: nil) } }.not_to change(Hock, :count)
      end

      it 'renders the new template' do
        post :create, params: { hock: FactoryBot.attributes_for(:hock, title: nil) }
        expect(response).to render_template('new')
      end
    end
  end

  describe '#edit' do
    it 'assigns the requested Hock to @hock' do
      hock = FactoryBot.create(:hock)
      get :edit, params: { id: hock.id }
      expect(assigns(:hock)).to eq(hock)
    end

    it 'renders the edit template' do
      hock = FactoryBot.create(:hock)
      get :edit, params: { id: hock.id }
      expect(response).to render_template('edit')
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'updates the requested Hock' do
        hock = FactoryBot.create(:hock)
        patch :update, params: { id: hock.id, hock: FactoryBot.attributes_for(:hock, title: 'New title') }
        hock.reload
        expect(hock.title).to eq('New title')
      end

      it 'redirects to the hocks index' do
        hock = FactoryBot.create(:hock)
        patch :update, params: { id: hock.id, hock: FactoryBot.attributes_for(:hock, title: 'New title') }
        expect(response).to redirect_to(hocks_url)
      end
    end

    context 'with invalid params' do
      it 'does not update the requested Hock' do
        hock = FactoryBot.create(:hock)
        patch :update, params: { id: hock.id, hock: FactoryBot.attributes_for(:hock, title: nil) }
        hock.reload
        expect(hock.title).not_to be_nil
      end

      it 'renders the edit template' do
        hock = FactoryBot.create(:hock)
        patch :update, params: { id: hock.id, hock: FactoryBot.attributes_for(:hock, title: nil) }
        expect(response).to render_template('edit')
      end
    end
  end

  describe '#destroy' do
    it 'destroys the requested Hock' do
      hock = FactoryBot.create(:hock)
      expect { delete :destroy, params: { id: hock.id } }.to change(Hock, :count).by(-1)
    end

    it 'redirects to the hocks index' do
      hock = FactoryBot.create(:hock)
      delete :destroy, params: { id: hock.id }
      expect(response).to redirect_to(hocks_url)
    end
  end

  describe '#set_hock' do
    it 'assigns the requested Hock to @hock' do
      hock = FactoryBot.create(:hock)
      get :edit, params: { id: hock.id }
      expect(assigns(:hock)).to eq(hock)
    end

    it 'raises an error if the Hock is not found' do
      expect { get :edit, params: { id: 'invalid' } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#hock_params' do
    it 'permits the correct parameters' do
      params = { hock: FactoryBot.attributes_for(:hock) }
      expect(controller.hock_params).to eq(params[:hock])
    end

    it 'does not permit extra parameters' do
      params = { hock: FactoryBot.attributes_for(:hock), extra: 'extra' }
      expect(controller.hock_params).not_to include('extra')
    end
  end

  describe '#format_errors' do
    it 'returns a formatted error message' do
      hock = FactoryBot.create(:hock)
      hock.errors.add(:title, 'is invalid')
      expect(controller.format_errors(hock)).to eq('1 Fehler verhinderte(n) das speichern des Höcks: Title is invalid')
    end
  end
end
