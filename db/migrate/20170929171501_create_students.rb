class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.sting :name
      t.string :nickname
      t.integer :dob
      t.string :picture
      t.integer :maiden_name
      t.string :tag
      t.string :template
      t.integer :id
      t.belongs_to :instructor, foreign_key: true

      t.timestamps
    end
  end
end
