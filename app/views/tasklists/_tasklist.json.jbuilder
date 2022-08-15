json.extract! tasklist, :id, :Taskname, :Status, :Duedate, :Details, :created_at, :updated_at
json.url tasklist_url(tasklist, format: :json)
