require 'rails_helper'

RSpec.describe Kleider, type: :model do

  describe "associations" do
    it { should have_one_attached(:image) }
  end
end
