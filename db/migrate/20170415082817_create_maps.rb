class CreateMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :maps do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :description
      t.float :lat1, length: 10, precision: 6
      t.float :long1, length: 10, precision: 6
      t.float :lat2, length: 10, precision: 6
      t.float :long2, length: 10, precision: 6

      t.timestamps
    end
  end
end
