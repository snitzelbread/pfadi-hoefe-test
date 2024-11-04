require 'rails_helper'

RSpec.describe Sponsor, type: :model do
  let(:sponsor) { create(:sponsor) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(sponsor).to be_valid
    end

    it "is not valid without a name" do
      sponsor.name = nil
      expect(sponsor).not_to be_valid
    end

    it "is not valid without a linky" do
      sponsor.linky = nil
      expect(sponsor).not_to be_valid
    end
  end

  describe "associations" do
    it { should have_one_attached(:image) }

    it "can have an image attached" do
      sponsor.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      expect(sponsor.image.attached?).to be true
    end
  end
end
