class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant, cost)
    participants[participant] = cost
  end

  def total_cost
    participants.values.sum
  end

  def split
    total_cost / participants.count
  end

  def owed
    name_money_owed = Hash.new
    
    participants.each do |participant, cost|
      name_money_owed[participant] = (split - cost)
    end

    name_money_owed
  end

end