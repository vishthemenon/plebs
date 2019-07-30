class Post < ApplicationRecord
  belongs_to :subject
  has_many :comments, as: :commentable
  belongs_to :user

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
