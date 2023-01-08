class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    reunion_owed = Hash.new(0)

    activities.each do |activity|
      activity.owed.each do |name, money_owed|
        # reunion_owed[name] = reunion_owed[name] + money_owed
        reunion_owed[name] += money_owed
      end
    end
    reunion_owed
  end

  def summary
    statement = ""
    breakout.each do |k, v|
     statement += "#{k}: #{v}\n"
    end
    statement.chomp
  end
end