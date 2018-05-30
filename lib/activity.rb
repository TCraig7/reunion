class Activity

  attr_reader   :name,
                :participants

  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participant(participant)
    @participants << participant
  end

  def calculate_base_cost
    base_cost = []
    @participants.map do |participant|
      base_cost << participant[:paid]
    end
    base_cost.sum
  end

  def calculate_average_cost
    calculate_base_cost/(@participants.count)    
  end
end
