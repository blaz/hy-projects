class ProjectStatusChange < ApplicationRecord
  enum :current_status, Project::STATUS_ENUM, instance_methods: false
  enum :previous_status, Project::STATUS_ENUM, instance_method: false

  belongs_to :project
  belongs_to :user

  validates :project, presence: true
  validates :user, presence: true
end
