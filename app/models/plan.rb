class Plan < ApplicationRecord
  belongs_to :provider
  belongs_to :parent, class_name: 'Plan', foreign_key: :parent_id
  has_many :related_plans, class_name: 'Plan', foreign_key: :parent_id

  t = arel_table
  scope :data,  ->(num) { where(data_num: num) }
  scope :sms,   ->(num) { where(sms_num: num) }
  scope :voice, ->(num) { where(voice_num: num) }
  scope :capacity_over, ->(capacity) {
    where(t[:capacity].gteq(capacity)).or(where(capacity: nil))
  }
end
