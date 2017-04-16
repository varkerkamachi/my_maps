class Marker < ApplicationRecord
  belongs_to :map, optional: true

  scope :of_map, ->(map_id){ where('map_id = ?', map_id) }
end
