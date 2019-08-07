class Subject < ApplicationRecord
  has_and_belongs_to_many :lecturers
  has_and_belongs_to_many :users
  has_many :learning_outcomes
  has_many :lectures
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true, format:
    {
      with: /\A[A-Z]{2}\S{5}/,
      message: 'has invalid format'
    }
  validates :year, presence: true, inclusion: 1..4
end
