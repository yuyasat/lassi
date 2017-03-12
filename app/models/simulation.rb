class Simulation < ApplicationRecord
  has_many :simulation_results
  has_many :plans, through: :simulation_results

  def simulate!
    type = case
           when voice? then 'voice'
           when sms? then 'sms'
           else 'data'
           end
    self.plans =
      Plan.public_send(carrier).public_send(type, 1).capacity_over(capacity).order(:price).limit(10)
    save!
  end
end
