class Instructor < ApplicationRecord
  belongs_to :admins
  has_many :students
end
