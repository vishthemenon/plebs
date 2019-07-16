class Subject < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true, format:
  {
    with: /\A[A-Z]{2}\S{5}/,
    message: 'has invalid format'
  }
  validates :year, presence: true, inclusion: 1..4

  has_and_belongs_to_many :lecturers
end
