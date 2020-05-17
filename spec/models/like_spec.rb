require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'trying to like the same cluck twice' do
    it 'is not allowed' do
      first_like = FactoryBot.create(:like)

      other_like = FactoryBot.build(
        :like,
        cluck: first_like.cluck,
        user: first_like.user
      )

      expect(other_like).not_to be_valid
    end
  end
end
