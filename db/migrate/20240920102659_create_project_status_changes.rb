class CreateProjectStatusChanges < ActiveRecord::Migration[7.2]
  def change
    create_table :project_status_changes do |t|
      t.enum :previous_status, enum_type: "project_status", null: false
      t.enum :current_status, enum_type: "project_status", null: false
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
