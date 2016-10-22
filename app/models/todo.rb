class Todo < ApplicationRecord
  belongs_to :task
  belongs_to :user
	audited
  enum status: { to_be_done: 0, done: 1 }
end
