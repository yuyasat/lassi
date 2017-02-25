class QaThread < ApplicationRecord
  belongs_to :user
  has_one :label, class_name: 'ThreadLabel', foreign_key: :qa_thread_id
  has_one :category, class_name: 'ThreadCategory', foreign_key: :qa_thread_id
  has_many :tags, class_name: 'ThreadTag', foreign_key: :qa_thread_id
  has_many :replies, class_name: 'QaReply',foreign_key: :qa_thread_id

  enum carrier: {
    other: 0,
    docomo: 1,
    au: 2,
    softbank: 3,
  }
end
