class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees

  accepts_nested_attributes_for :offices

  validates :name, presence: true

  def total_rent_paying
    offices.inject(0) { |sum, office|
      sum + office.building.rent_per_floor
    }
  end
end
