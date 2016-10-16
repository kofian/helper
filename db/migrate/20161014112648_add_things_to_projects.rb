class AddThingsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string
    add_column :projects, :contact_email, :string
    add_column :projects, :state, :string
    add_column :projects, :url, :string
    add_column :projects, :review_tags, :text
    add_column :projects, :start_date, :datetime
    add_column :projects, :end_date, :datetime
    add_column :projects, :custom_fields, :text
    add_column :projects, :archived, :boolean, default: false
  end
end
