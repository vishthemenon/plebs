class AddCommentableToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :commentable, polymorphic: true, index: true
  end
end
