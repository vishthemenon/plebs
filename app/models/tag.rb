class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, uniqueness: true, format:
    {
      with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i,
      message: 'is an invalid color format'
    } 
end
