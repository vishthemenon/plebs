class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :year
      t.string :code

      t.timestamps
    end
  end
end
