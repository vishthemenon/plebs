class Post < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_and_belongs_to_many :tags

  has_one_attached :document

  validates :title, presence: true
  validate :document_mime_type

  private

  def document_mime_type
    if document.attached? && !document.content_type.in?('application/pdf')
      errors.add(:document, 'Must be a PDF file')
    end
  end

end
