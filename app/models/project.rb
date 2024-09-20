class Project < ApplicationRecord
  STATUSES = %i[not_started in_progress pending_completion completed].freeze
  STATUS_ENUM = STATUSES.each_with_object({}) { |status, hash| hash[status] = status.to_s }.freeze

  enum :status, STATUS_ENUM

  has_many :comments, -> { order(created_at: :desc) }, class_name: :ProjectComment
  has_many :status_changes, -> { order(created_at: :desc) }, class_name: :ProjectStatusChange

  has_and_belongs_to_many :users
end
