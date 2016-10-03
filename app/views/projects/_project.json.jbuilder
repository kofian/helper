json.extract! project, :id, :title, :description, :image_url, :estimate, :created_at, :updated_at
json.url project_url(project, format: :json)