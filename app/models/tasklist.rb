class Tasklist < ApplicationRecord
  belongs_to :user
  validates :Taskname, presence: true, uniqueness: true
end
