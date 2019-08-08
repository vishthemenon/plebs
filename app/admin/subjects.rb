ActiveAdmin.register Subject do
  form do |f|
    f.inputs "Subjects" do
      f.input :name
      f.input :year
      f.input :code
      f.input :lecturers, :as => :select, :collection => Lecturer.all.collect {|l| [l.name, l.id] }
      # f.collection_select :lecturers, Lecturer.all, :id, :name,{}, {:multiple => true}
    end
    f.submit
  end

  show do
    attributes_table_for subject do
      row :name
      row :year
      row :code
      row('Lecturers') { |l| l.lecturers.map { |l| l.name } }
    end
  end

  permit_params :name, :year, :code, lecturer_ids: []
end
