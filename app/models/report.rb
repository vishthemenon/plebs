class Report < ApplicationRecord
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :reason, presence: true, format:
    {
      with: /\A(Inappropriate Content|Mistake)/,
      message: 'Invalid type'
    }
end
