require 'rails_helper'

RSpec.describe Cluck, type: :model do
  context '8 word length content' do
    it 'has 8 words in the content' do
      content = 'now there are eight words for the test'
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).to be_valid
    end

    it 'has only 3 word' do
      content = 'three word tes'
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).not_to be_valid
      expect(cluck.errors.full_messages).to include('cluck must be 8 words long')
    end
  end

  context 'word length' do
    it 'count words of content' do
      content = 'three word test'
      cluck = FactoryBot.build(:cluck, content: content)
      expect(cluck.content_word_count).to eq(3) 
    end
  end
end