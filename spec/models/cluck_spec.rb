require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

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

  context '100 character limit' do
    it 'content with more then 100 chars' do
      content = 'ldpsosidnmpwe ' * 8
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).not_to be_valid
      expect(cluck.errors.messages[:content]).to include('is too long (maximum is 100 characters)')
    end

    it 'content with less then 100 chars' do
      content = 'klk7 ' * 8
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).to be_valid
    end
  end

  context 'trailing and leading spaces' do
    it 'deletes all trailing and leading spaces' do
      content = ' ldpsosidn' * 8
      cluck = FactoryBot.create(:cluck, content: content)
      expect(cluck.content).to eq('ldpsosidn ' * 7 + 'ldpsosidn')
    end
  end

  context 'same content' do
    it 'can not create same content on the same day' do
      content = 'hello ' * 8
      cluck_one = FactoryBot.create(:cluck, content: content)
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).not_to be_valid
      expect(cluck.errors.full_messages).to include("content is not unique for #{Date.current.to_date}")
    end

    it 'can create same content on next day' do
      travel_to(1.day.ago)
      content = 'hello ' * 8
      cluck_one = FactoryBot.create(:cluck, content: content)
      travel(1.day)
      cluck = FactoryBot.build(:cluck, content: content)
      cluck.save
      expect(cluck).to be_valid
    end
  end
end