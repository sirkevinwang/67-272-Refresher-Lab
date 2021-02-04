class Chore < ApplicationRecord
  # Relations
  belongs_to :child
  belongs_to :task

  # Scopes 
  scope :by_task, -> { joins(:task).order("tasks.name") }
  scope :pending, -> { where(completed: false) }
  scope :done, -> { where(completed: true) }
  scope :upcoming, -> { where('due_on >= ?', Date.current) }
  scope :past, -> { where('due_on < ?', Date.current) }
  scope :chronological, -> { order('due_on, completed') }

  # Validators
  validates_date :due_on
  
  # Methods
  def status
    if self.completed
      return "Completed"
    end
    "Pending"
  end
  
end
