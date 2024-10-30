# spec/models/leader.rb
require 'rails_helper'

RSpec.describe Leader, type: :model do
  describe 'validations' do

    let(:leader) { create(:leader) }

    it "is valid with all attributes" do
      expect(leader).to be_valid
    end

    it "is not valid without an email" do
      leader.email = nil
      expect(leader).not_to be_valid
    end

    it "is not valid without a password" do
      leader.email = nil
      expect(leader).not_to be_valid
    end

    it "is still valid without first name, last name, stufe, funktion, pfadiname" do
      leader = FactoryBot.build(:leader, first_name: nil, last_name: nil, stufe: nil, funktion: nil, pfadiname: nil)
      expect(leader).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:hocks) }
    it { should have_one_attached(:image) }
    it { should have_many(:camps) }

    let(:leader) { create(:leader) }
    let(:camp) { create(:camp, leader: leader) }

    it "should have camps" do
      expect(leader.camps).to include(camp)
    end

  end

  describe 'methods' do
    describe '#unique_global_funktionen' do
      it 'adds an error if the funktion is not unique' do
        leader = create(:leader, funktion: 'Stv. Abteilungsleitung')
        leader2 = build(:leader, funktion: 'Stv. Abteilungsleitung')

        expect(leader2.valid?).to be false
        expect(leader2.errors[:funktion]).to include('Stv. Abteilungsleitung kann es nur einmal geben.')
      end

      it 'does not add an error if the funktion is unique' do
        leader = create(:leader, funktion: 'Stv. Abteilungsleitung')
        leader2 = build(:leader, funktion: 'Abteilungsleitung')

        expect(leader2.valid?).to be true
      end
    end

    describe '#unique_stufenleitung_for_stufe' do
      it 'adds an error if there is already a leader with the same stufe and funktion' do
        leader = create(:leader, stufe: 'Biber', funktion: 'Stufenleitung')
        leader2 = build(:leader, stufe: 'Biber', funktion: 'Stufenleitung')

        expect(leader2.valid?).to be false
        expect(leader2.errors[:funktion]).to include('Stufenleitung can only be assigned to one Leader per stufe')
      end

      it 'does not add an error if there is no leader with the same stufe and funktion' do
        leader = create(:leader, stufe: 'Biber', funktion: 'Stufenleitung')
        leader2 = build(:leader, stufe: 'Woelfli', funktion: 'Stufenleitung')

        expect(leader2.valid?).to be true
      end
    end
  end
end
