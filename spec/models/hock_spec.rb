require 'rails_helper'

RSpec.describe Hock, type: :model do

  let(:hock) { create(:hock) }
  it { should belong_to(:leader) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(hock).to be_valid
    end

    it "is not valid without a title" do
      hock.title = nil
      expect(hock).not_to be_valid
    end

    it "is not valid without a description" do
      hock.description = nil
      expect(hock).not_to be_valid
    end

    it "is not valid without a datetime" do
      hock.datetime = nil
      expect(hock).not_to be_valid
    end

    it "is not valid without a leader" do
      hock.leader = nil
      expect(hock).not_to be_valid
    end

    it "is not valid without a ort" do
      hock.ort = nil
      expect(hock).not_to be_valid
    end

    it "is not valid without a stufe" do
      hock.stufe = nil
      expect(hock).not_to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:leader) }
  end

  describe "methods" do
    it "can tell me the name of the leader" do
      expect(hock.pfadiname_of_leader(hock.leader_id)).to eq(hock.leader.pfadiname)
      expect(hock.pfadiname_of_leader(hock.leader.id)).not_to eq("DIAWJIODWJ")
    end
  end

  describe "scopes" do
    describe '.closest_hock_by_stufe' do
      it 'returns the closest hock by stufe in the future' do
        stufe = 'Biber'

        hock1 = create(:hock, stufe: stufe, datetime: 1.day.ago)
        hock2 = create(:hock, stufe: stufe, datetime: 1.days.from_now)
        hock3 = create(:hock, stufe: stufe, datetime: 2.days.from_now)

        expect(Hock.all.closest_hock_by_stufe(stufe).first).to eq(hock2)
      end

      it 'returns an empty array if no hocks are found' do
        stufe = 'Biber'

        expect(Hock.closest_hock_by_stufe(stufe)).to be_empty
      end
    end

    describe '.all_stufen_hocks' do
      it 'returns all hocks by stufe' do
        stufe = 'Biber'
        hock1 = create(:hock, stufe: stufe, datetime: 1.day.ago)
        hock2 = create(:hock, stufe: stufe, datetime: Time.zone.now)
        hock3 = create(:hock, stufe: 'Woelfli', datetime: 1.day.ago)

        expect(Hock.all_stufen_hocks(stufe)).to match_array([hock1, hock2])
      end

      it 'returns an empty array if no hocks are found' do
        stufe = 'Biber'

        expect(Hock.all_stufen_hocks(stufe)).to be_empty
      end
    end
  end
end
