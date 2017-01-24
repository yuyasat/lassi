class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable
  has_many :question_sets
  has_many :questions
  has_many :user_try_history_relationships
  has_many :try_histories, through: :user_try_history_relationships
  has_many :favorites
  has_many :favorite_sets, through: :favorites, source: :question_set

  validates :password, length: { in: Devise.password_length }
end
