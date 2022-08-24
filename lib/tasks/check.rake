require 'rubygems'

namespace :check do
  desc "TODO"
  task :due_date_remainder, [:user,:tasklist] => :environment do
    #puts "cronjob"
    
    #user=User.find_by_id(27)
    #user = :user.to_s
    #puts user
    tasklists=Tasklist.all

    #tasklists=Tasklist.where("Duedate<=? and Status = ?",Time.now,false) 

    # tasklists.each { |task| puts task.Duedate}
    #puts tasklists.Duedate
    # if tasklists.Duedate.to_s<Time.now
    #   puts tasklists
    #   NewUserEmailMailer.task_due(user,tasklist).deliver_now
    # end
    #if tasklists.present?
      tasklists.each do |task|
        #puts task.Duedate
        if task.Duedate.to_s<=Time.now and task.Status==false
          #puts task.Duedate
          user = User.find_by_id(task.user_id)
          NewUserEmailMailer.task_due(user,task).deliver_now
          puts " "
        end
      end

    
  end

end
