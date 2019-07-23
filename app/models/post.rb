class Post < ApplicationRecord
  belongs_to :subject

  has_one_attached :document

  validate :document_mime_type

  private

  def document_mime_type
    if document.attached? && !document.content_type.in?('application/pdf')
      errors.add(:document, 'Must be a PDF file')
    end
  end

end
