json.extract! course_module, :id, :name, :code, :year, :lecturer, :created_at, :updated_at
json.url course_module_url(course_module, format: :json)
