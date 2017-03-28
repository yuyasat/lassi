class Terminal < ApplicationRecord
  belongs_to :maker
  has_many :simulation

  def available_carrier
    case
    when au? && band18_26? && band1?
      'au'
    when docomo? && band1? && band19?
      'docomo'
    else
      'other'
    end
  end
end
