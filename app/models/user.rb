class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  ROLES = %i[solicitor agent client].freeze
  ROLES_ENUM = ROLES.each_with_object({}) { |status, hash| hash[status] = status.to_s }.freeze
  
  enum :role, ROLES_ENUM

  has_and_belongs_to_many :projects

  def solicitor?
    role == 'solicitor'
  end
end
