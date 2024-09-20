class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_and_belongs_to_many :projects
end
