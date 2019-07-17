class CreateJoinTableLecturerSubject < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lecturers, :subjects do |t|
      t.index [:lecturer_id, :subject_id]
      t.index [:subject_id, :lecturer_id]
    end
  end
end
