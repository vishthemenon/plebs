class RemovePostsFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :post, null: false, foreign_key: true, index: true
  end
end
