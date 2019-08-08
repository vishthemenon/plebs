ActiveAdmin.register Post do
  form do |f|
    f.inputs "Subjects" do
      f.input :subject, :as => :select, :collection => Subject.all.collect {|s| [s.name, s.id] }
      f.input :user, :as => :select, :collection => User.all.collect {|u| [u.email, u.id] }
      f.input :body
      f.input :title
    end
    f.submit
  end

  permit_params :subject_id, :user_id, :body, :title
end
