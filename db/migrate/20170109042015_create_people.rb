class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :lonlat
      t.string :items

      t.timestamps
    end
  end
end
