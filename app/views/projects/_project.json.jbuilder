json.extract! project, :id, :project_name, :project_description, :project_difficulty, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
