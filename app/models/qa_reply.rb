class QaReply < ApplicationRecord
  belongs_to :user
  belongs_to :qa_thread
  has_many :replies, class_name: 'QaReply',foreign_key: :qa_reply_id
end
