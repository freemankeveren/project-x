class Admin < ApplicationRecord
  belongs_to :organizations
  belongs_to :schools
  has_many :instructors
  has_many :students, through: :instructors
end
