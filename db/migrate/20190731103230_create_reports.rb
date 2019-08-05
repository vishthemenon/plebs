class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :reason
      t.text :description
      t.boolean :resolved, default: :false
      t.references :user, null: false, foreign_key: true, index: true
      t.references :reportable, polymorphic: true, null: false, index: true

      t.timestamps
    end
  end
end
