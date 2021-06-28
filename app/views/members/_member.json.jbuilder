json.extract! member, :id, :name, :username, :email, :created_at, :updated_at
json.url member_url(member, format: :json)
