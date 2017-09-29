class School < ApplicationRecord
  belongs_to :owners
  belongs_to :organizations
  has_many :admins
  has_many :instructors, through: :admins
end
