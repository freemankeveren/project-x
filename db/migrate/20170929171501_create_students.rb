class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :nickname
      t.integer :dob
      t.string :picture
      t.integer :maiden_name
      t.string :tag
      t.string :template
      t.belongs_to :instructor, foreign_key: true

      t.timestamps
    end
  end
end
