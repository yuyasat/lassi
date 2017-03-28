class Simulation < ApplicationRecord
  has_many :simulation_results
  has_many :plans, through: :simulation_results
  belongs_to :terminal

  def simulate!
    self.plans = Plan.public_send(simulation_carrier)
                     .public_send(simulation_type, 1)
                     .capacity_over(capacity).order(:price).limit(10)
    save!
  end

  private

  def simulation_carrier
    return carrier if terminal.blank?
    terminal.available_carrier
  end

  def simulation_type
    case
    when voice? then 'voice'
    when sms? then 'sms'
    else 'data'
    end
  end
end
