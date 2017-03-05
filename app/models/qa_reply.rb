class QaReply < ApplicationRecord
  belongs_to :user
  belongs_to :qa_thread
  has_many :replies, class_name: 'QaReply',foreign_key: :qa_reply_id

  DIRECTLY_BELOW = 0
  scope :directly_below, -> { where(qa_reply_id: DIRECTLY_BELOW) }
end
