class CreateLearningOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_outcomes do |t|
      t.text :content
      t.boolean :completed, default: false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
