class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :phone
      t.integer :id
      t.belongs_to :owner, foreign_key: true

      t.timestamps
    end
  end
end
