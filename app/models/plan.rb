class Plan < ApplicationRecord
  belongs_to :provider
  belongs_to :parent, class_name: 'Plan', foreign_key: :parent_id
  has_many :related_plans, class_name: 'Plan', foreign_key: :parent_id

  enum carrier: {
    other: 0,
    docomo: 1,
    au: 2,
    softbank: 3,
  }
end
