json.extract! user, :id, :user_id, :username, :name, :email, :address, :cc_num, :phone_num, :created_at, :updated_at
json.url user_url(user, format: :json)
