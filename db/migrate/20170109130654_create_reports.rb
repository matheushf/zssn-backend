class CreateReport < ActiveRecord::Migration[5.0]
  def change
    create_table :report do |t|

      t.timestamps
    end
  end
end
