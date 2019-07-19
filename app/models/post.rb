class Post < ApplicationRecord
  belongs_to :subject

  has_one_attached :document
end
