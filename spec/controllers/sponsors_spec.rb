require 'rails_helper'

RSpec.describe SponsorsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'loads all sponsors' do
      sponsors = create_list(:sponsor, 3)

      get :index

      expect(assigns(:sponsors)).to match_array(sponsors)
    end
  end

  describe 'GET #show_all' do
    it 'returns http success' do
      leader = create(:leader)
      sign_in leader

      get :show_all

      expect(response).to have_http_status(:success)
    end

    it 'loads all sponsors' do
      leader = create(:leader)
      sign_in leader
      sponsors = create_list(:sponsor, 3)

      get :show_all

      expect(assigns(:sponsors)).to match_array(sponsors)
    end

    it 'redirects to login page if not signed in' do
      get :show_all

      expect(response).to redirect_to(login_path)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      leader = create(:leader)
      sign_in leader

      get :new

      expect(response).to have_http_status(:success)
    end

    it 'redirects to login page if not signed in' do
      get :new

      expect(response).to redirect_to(login_path)
    end
  end

  describe 'POST #create' do
    it 'creates a new sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor_params = attributes_for(:sponsor)

      expect {
        post :create, params: { sponsor: sponsor_params }
      }.to change(Sponsor, :count).by(1)
    end

    it 'redirects to sponsors page after creating a sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor_params = attributes_for(:sponsor)

      post :create, params: { sponsor: sponsor_params }

      expect(response).to redirect_to(sponsors_show_all_path)
    end

    it 'redirects to login page if not signed in' do
      sponsor_params = attributes_for(:sponsor)

      post :create, params: { sponsor: sponsor_params }

      expect(response).to redirect_to(login_path)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)

      get :edit, params: { id: sponsor.id }

      expect(response).to have_http_status(:success)
    end

    it 'loads the sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)

      get :edit, params: { id: sponsor.id }

      expect(assigns(:sponsor)).to eq(sponsor)
    end

    it 'redirects to login page if not signed in' do
      sponsor = create(:sponsor)

      get :edit, params: { id: sponsor.id }

      expect(response).to redirect_to(login_path)
    end
  end

  describe 'PUT #update' do
    it 'updates the sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)
      sponsor_params = attributes_for(:sponsor, name: 'New Name')

      put :update, params: { id: sponsor.id, sponsor: sponsor_params }

      expect(sponsor.reload.name).to eq('New Name')
    end

    it 'redirects to sponsors page after updating a sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)
      sponsor_params = attributes_for(:sponsor, name: 'New Name')

      put :update, params: { id: sponsor.id, sponsor: sponsor_params }

      expect(response).to redirect_to(sponsors_show_all_path)
    end

    it 'redirects to login page if not signed in' do
      sponsor = create(:sponsor)
      sponsor_params = attributes_for(:sponsor, name: 'New Name')

      put :update, params: { id: sponsor.id, sponsor: sponsor_params }

      expect(response).to redirect_to(login_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)

      expect {
        delete :destroy, params: { id: sponsor.id }
      }.to change(Sponsor, :count).by(-1)
    end

    it 'redirects to sponsors page after destroying a sponsor' do
      leader = create(:leader)
      sign_in leader
      sponsor = create(:sponsor)

      delete :destroy, params: { id: sponsor.id }

      expect(response).to redirect_to(sponsors_show_all_path)
    end

    it 'redirects to login page if not signed in' do
      sponsor = create(:sponsor)

      delete :destroy, params: { id: sponsor.id }

      expect(response).to redirect_to(login_path)
    end
  end
end
