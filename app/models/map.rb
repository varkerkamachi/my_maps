class Map < ApplicationRecord
  belongs_to :user
  has_many :markers

  validates_presence_of :user_id

  scope :of_user, ->(user_id) { where('user_id = ?', user_id) }
end
