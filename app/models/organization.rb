class Organization < ApplicationRecord
  belongs_to :owners
  has_many :schools
  has_many :admins
end
