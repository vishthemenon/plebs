class CreateLecturers < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :directory_url

      t.timestamps
    end
  end
end
