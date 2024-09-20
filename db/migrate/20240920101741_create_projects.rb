class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_enum :project_status, %w(not_started in_progress pending_completion completed)

    create_table :projects do |t|
      t.string :name
      t.enum :status, enum_type: "project_status", default: "not_started", null: false

      t.timestamps
    end
  end
end
