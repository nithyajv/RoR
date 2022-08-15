json.extract! tasklist, :id, :Task_name, :Details, :Due_date, :created_at, :updated_at
json.url tasklist_url(tasklist, format: :json)
