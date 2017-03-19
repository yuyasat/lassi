class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :new_order, -> { order('id desc') }

  enum carrier: {
    other: 0,
    docomo: 1,
    au: 2,
    softbank: 3,
  }

  def self.latest
    order(:id).last
  end
end
