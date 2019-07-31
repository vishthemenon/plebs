class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :reports, as: :reportable

  validates :body, presence: true
end
