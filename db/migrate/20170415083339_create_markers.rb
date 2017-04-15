class CreateMarkers < ActiveRecord::Migration[5.1]
  def change
    create_table :markers do |t|
      t.references :map, foreign_key: true
      t.string :name
      t.text :description
      t.integer :resident_count
      t.string :marker_type

      t.timestamps
    end
  end
end
