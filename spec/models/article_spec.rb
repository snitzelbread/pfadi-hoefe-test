require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(article).to be_valid
    end

    it "is not valid without a title" do
      article.title = nil
      expect(article).not_to be_valid
    end

    it "is not valid without a content" do
      article.content = nil
      expect(article).not_to be_valid
    end
  end

  describe "associations" do
    it { should have_many_attached(:images) }

    it "can have multiple images attached" do
      article.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      article.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png')
      expect(article.images.attached?).to be true
      expect(article.images.count).to eq(2)
    end
  end

  describe "scopes" do
    describe ".latest_articles" do
      it "returns the latest articles" do
        article1 = create(:article, created_at: 1.day.ago)
        article2 = create(:article, created_at: 2.days.ago)
        article3 = create(:article, created_at: 3.days.ago)

        expect(Article.latest_articles).to match_array([ article1, article2, article3 ])
      end

      it "returns an empty array if no articles are found" do
        expect(Article.latest_articles).to be_empty
      end
    end
  end
end
