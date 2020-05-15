require 'rails_helper'

RSpec.describe Recluck, type: :model do
  context 'trying to recluck the same cluck twice' do
    it 'is not allowed' do
      first_recluck = FactoryBot.create(:recluck)

      other_recluck = FactoryBot.build(
        :recluck,
        cluck: first_recluck.cluck,
        user: first_recluck.user
      )

      expect(other_recluck).not_to be_valid
    end
  end
end
