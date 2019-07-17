class LearningOutcome < ApplicationRecord
  belongs_to :subject

  validates :content, presence: true, uniqueness: true
end
