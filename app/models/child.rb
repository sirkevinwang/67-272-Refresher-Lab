class Child < ApplicationRecord
  # Relations
  has_many :chores
  has_many :tasks, through: :chores 
  
  # Scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }

  # Validations
  validates_presence_of :first_name, :last_name

  # Methods
  def name
    self.first_name + " " + self.last_name
  end
end
