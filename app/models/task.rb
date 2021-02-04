class Task < ApplicationRecord
  # Relations
  has_many :chores
  has_many :children, through: :chores
  
  # Scopes
  scope :alphabetical,    -> { order('name') }
  scope :active,          -> { where(active: true) }

  # Validators
  validates_presence_of :name
  validates_numericality_of :points, greater_than_or_equal_to: 0, only_integer: true
end
