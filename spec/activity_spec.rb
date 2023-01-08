require 'rspec'
require './lib/activity'

RSpec.describe Activity do
  let(:activity) { Activity.new("Brunch") }

  describe 'Iteration 1' do
    it 'exists' do
      expect(activity).to be_an(Activity)
    end

    it 'has attributes' do
      expect(activity.name).to eq("Brunch")
      expect(activity.participants).to eq({})

    end
  end
end