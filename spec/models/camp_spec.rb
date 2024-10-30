# spec/models/camp_spec.rb
require 'rails_helper'

RSpec.describe Camp, type: :model do

  let(:camp) { create(:camp) }
  it { should belong_to(:leader) }
  it { should have_many_attached(:images) }

  describe "validations" do
    it "is valid with a name, general description, quote, template, and this camp description" do
      expect(camp).to be_valid
    end

    it "is not valid without a leader" do
      camp.leader = nil
      expect(camp).to be_invalid
    end

    it "is not valid without a name" do
      camp.name = nil
      expect(camp).not_to be_valid
    end

    it "is not valid without a general description" do
      camp.general_description = nil
      expect(camp).not_to be_valid
    end

    it "is not valid without a template" do
      camp.template = nil
      expect(camp).not_to be_valid
    end
  end

  describe 'associations' do
    let(:leader) { create(:leader) }
    let(:camp) { create(:camp, leader: leader) }

    it 'has a leader' do
      expect(camp.leader).to eq(leader)
    end

    it 'has images' do
      camp.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      expect(camp.images.count).to eq(1)
    end
  end

end
