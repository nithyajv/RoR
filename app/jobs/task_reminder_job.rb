class TaskReminderJob < ApplicationJob
  queue_as :default

  def perform(tasklist)
    # Do something later
    user=User.find_by_id(tasklist.user_id)
    if tasklist.Duedate<Time.now
      NewUserEmailMailer.task_due(user,tasklist).deliver_now
    end
  end
end
