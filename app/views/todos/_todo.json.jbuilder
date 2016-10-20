json.extract! todo, :id, :name, :description, :task_id, :user_id, :ends_at, :created_at, :updated_at
json.url todo_url(todo, format: :json)