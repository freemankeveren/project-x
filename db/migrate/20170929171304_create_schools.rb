class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :picture
      t.string :location
      t.integer :phone
      t.integer :id

      t.timestamps
    end
  end
end
