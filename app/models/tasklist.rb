class Tasklist < ApplicationRecord
  belongs_to :user
  validates :Taskname, presence: true, uniqueness: true

  
  # after_save_commit do
  #   if Duedate_previously_changed?
  #   TaskReminderJob.set(wait_until: self.Duedate.to_s).perform_later(self)
  #   end
  # end

end
