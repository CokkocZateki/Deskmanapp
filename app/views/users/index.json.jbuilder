json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :homedesk, :password, :accesslevel
  json.url user_url(user, format: :json)
end
