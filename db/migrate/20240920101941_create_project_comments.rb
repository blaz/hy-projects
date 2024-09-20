class CreateProjectComments < ActiveRecord::Migration[7.2]
  def change
    create_table :project_comments do |t|
      t.string :content
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
