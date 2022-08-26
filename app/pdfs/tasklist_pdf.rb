class TasklistPdf < Prawn::Document
  include Prawn::View

  def initialize(tasklists)
    super()
    @tasklists=Tasklist.all
    task_id
    
  end

  def task_id
    table task_id_all    
  end

  def task_id_all
    [["Taskname","Status","Duedate","Details","user_id"]]+
    @tasklists.map do |task|
      [task.Taskname,task.Status ? "Completed" : "Pending",task.Duedate,task.Details,task.user_id]
    end
  
  end
end