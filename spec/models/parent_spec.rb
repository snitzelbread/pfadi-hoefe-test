require 'rails_helper'

RSpec.describe Parent, type: :model do
  let(:parent) { create(:parent) }

  it { should have_secure_password }

  describe "validations" do
    it "is valid with all attributes" do
      expect(parent).to be_valid
    end

    it "is not valid without an email" do
      parent.email = nil
      expect(parent).not_to be_valid
    end

    it "is not valid without a password" do
      parent.password = nil
      expect(parent).not_to be_valid
    end

    it "is not valid without a password confirmation" do
      parent.password_confirmation = nil
      expect(parent).not_to be_valid
    end
  end
end
