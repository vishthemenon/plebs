
class Lecturer < ApplicationRecord
  has_and_belongs_to_many :subjects
  validates :name, presence: true, uniqueness:true
  validates :directory_url, presence: true, uniqueness:true, format:
  {
    with: /www\.[a-z]*\.[a-z]*/,
    message: 'has invalid format'
  }
end
