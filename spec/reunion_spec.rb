require 'rspec'
require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  let(:reunion) { Reunion.new("1406 BE") }
  let(:activity_1) { Activity.new("Brunch") }
  let(:activity_2) { Activity.new("Drinks") }


  describe 'Initialize' do
    it 'exists' do
      expect(reunion).to be_a(Reunion)
    end

    it 'has attributes' do
      expect(reunion.name).to eq("1406 BE")
      expect(reunion.activities).to eq([])
    end
  end

  describe '#add_activity' do
    it 'can add activities to array' do
      reunion.add_activity(activity_1)
      expect(reunion.activities).to eq([activity_1])
    end
  end
  
  describe 'cost of all activities' do
    it 'can calculate the #total_cost of multiple activities' do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)

      expect(reunion.total_cost).to eq(60)

      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)
      reunion.add_activity(activity_2)

      expect(reunion.total_cost).to eq(180)
    end
  end

  describe 'split bill and calculate money owed by participant' do
    it '#breakout' do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)

      expect(reunion.total_cost).to eq(60)

      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)
      reunion.add_activity(activity_2)

      expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end
  end
end