class Owner < ApplicationRecord
  belongs_to :user
  has_many :schools, dependent: :destroy
  has_many :organizations, dependent: :destroy
  has_many :admins, through: :schools
end
