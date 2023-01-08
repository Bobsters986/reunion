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

    it 'can #add_participants' do
      activity.add_participant("Maria", 20)
      expect(activity.participants).to eq({"Maria" => 20})

      activity.add_participant("Luther", 40)
      expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end
  end

  describe 'Iteration 2' do
    it '#split' do
      activity.add_participant("Maria", 20)
      activity.add_participant("Luther", 40)

      expect(activity.total_cost).to eq(60)
      expect(activity.split).to eq(30)
    end

    it '#owed' do
      activity.add_participant("Maria", 20)
      activity.add_participant("Luther", 40)

      expect(activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end

end