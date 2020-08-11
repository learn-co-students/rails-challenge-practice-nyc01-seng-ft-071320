class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :office

  validates :name, :title, presence: true
  validates :name, length: { minimum: 5 }
end
