class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :picture
      t.string :location
      t.integer :phone
      t.belongs_to :owner, foreign_key: true
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
