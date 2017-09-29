class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :phone
      t.string :picture
      t.integer :id

      t.timestamps
    end
  end
end
