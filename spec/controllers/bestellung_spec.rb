# spec/controllers/bestellung_controller_spec.rb
require 'rails_helper'

RSpec.describe BestellungController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new

      expect(response).to have_http_status(:success)
    end

    it 'assigns a new Bestellung to @bestellung' do
      get :new

      expect(assigns(:bestellung)).to be_a_new(Bestellung)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'doesnt save the new Bestellung in the database' do
        expect {
          post :create, params: { bestellung: attributes_for(:bestellung) }
        }.to change(Bestellung, :count).by(0)
      end

      # it 'sends an email with the Bestellung' do
      #   expect {
      #     post :create, params: { bestellung: attributes_for(:bestellung) }
      #   }.to have_enqueued_job.on_queue('mailers')
      # end

      it 'redirects to the kleiders path' do
        post :create, params: { bestellung: attributes_for(:bestellung) }

        expect(response).to redirect_to(kleiders_path)
      end

      it 'sets a flash notice' do
        post :create, params: { bestellung: attributes_for(:bestellung) }

        expect(flash[:notice]).to eq("Bestellung was successfully created, and email has been sent.")
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new Bestellung in the database' do
        expect {
          post :create, params: { bestellung: attributes_for(:bestellung, first_name: '') }
        }.not_to change(Bestellung, :count)
      end

      it 'renders the new template' do
        post :create, params: { bestellung: attributes_for(:bestellung, first_name: '') }

        expect(response).to render_template(:new)
      end

      it 'sets a flash alert' do
        post :create, params: { bestellung: attributes_for(:bestellung, first_name: '') }

        expect(flash[:alert]).to eq("Bestellung was unsuccessful. Please try again.")
      end
    end
  end

  describe '#format_shopping_list' do
    it 'formats a shopping list with a single item' do
      shopping_list = [ { "amount" => "2", "name" => "Apple", "price" => "1.99" } ]
      expected_output = "2 x Apple für je 1.99 (Total: 3.98)"

      expect(controller.format_shopping_list(shopping_list)).to eq(expected_output)
    end

    it 'formats a shopping list with multiple items' do
      shopping_list = [
        { "amount" => "2", "name" => "Apple", "price" => "1.99" },
        { "amount" => "3", "name" => "Banana", "price" => "0.99" }
      ]
      expected_output = "2 x Apple für je 1.99 (Total: 3.98)<br />3 x Banana für je 0.99 (Total: 2.97)"

      expect(controller.format_shopping_list(shopping_list)).to eq(expected_output)
    end

    it 'handles empty shopping list' do
      shopping_list = []
      expected_output = ""

      expect(controller.format_shopping_list(shopping_list)).to eq(expected_output)
    end

    # it 'handles shopping list with invalid data' do
    #   shopping_list = [{ "amount" => "abc", "name" => "Apple", "price" => "def" }]
    #   expected_output = ""
    #
    #   expect(controller.format_shopping_list(shopping_list)).to eq(expected_output)
    # end
  end
end
