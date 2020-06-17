require 'rails_helper'

RSpec.describe Recluck, type: :model do
  it 'can only recluck ones' do
    recluck = FactoryBot.create(:recluck)
    r = Recluck.new(user: recluck.user, cluck: recluck.cluck)
    expect(r).to_not be_valid
  end

  it 'can recluck as the same user' do
    recluck = FactoryBot.create(:recluck)
    r = Recluck.new(user: recluck.user, cluck: FactoryBot.create(:cluck))
    expect(r).to be_valid
  end
end
