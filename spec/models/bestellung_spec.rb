require 'rails_helper'

RSpec.describe Bestellung, type: :model do
  let(:bestellung) { create(:bestellung) }

  describe "validations" do
    it 'is valid with valid attributes' do
      expect(bestellung).to be_valid
    end

    it 'is invalid without first name' do
      bestellung = FactoryBot.build(:bestellung, first_name: nil)
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without last name' do
      bestellung.first_name = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without email' do
      bestellung.last_name = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without phone' do
      bestellung.phone = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without address' do
      bestellung.address = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without city' do
      bestellung.city = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without zipcode' do
      bestellung.zipcode = nil
      expect(bestellung).not_to be_valid
    end

    it 'is invalid without message' do
      bestellung.message = nil
      expect(bestellung).not_to be_valid
    end
  end
end
