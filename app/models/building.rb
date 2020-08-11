class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  validates :name, :country, :address, :rent_per_floor, :number_of_floors, presence: true

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def rent_in_total
    offices.count * rent_per_floor
  end

  def num_of_employees
    offices.inject(0) { |sum, office|
      sum + office.company.employees.count
    }
  end
end
