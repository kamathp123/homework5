json.array!(@users) do |user|
  json.extract! user, :id, :lname, :fname, :email, :thumbnail
  json.url user_url(user, format: :json)
end
