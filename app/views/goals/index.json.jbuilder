json.array!(@goals) do |goal|
  json.extract! goal, :id, :startdate, :enddate, :name, :details, :complete
  json.url goal_url(goal, format: :json)
end
