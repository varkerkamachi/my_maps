class Map < ApplicationRecord
  belongs_to :user, optional: true #
  has_many :markers

  validates_presence_of :user_id
  # validates :lat1, :lat2, :long1, :long2, presence: true

  scope :of_user, ->(user_id) { where('user_id = ?', user_id) }
end
