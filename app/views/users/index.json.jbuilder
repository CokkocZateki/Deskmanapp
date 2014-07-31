json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :desk_id, :password, :accesslevel
  json.url user_url(user, format: :json)
end
