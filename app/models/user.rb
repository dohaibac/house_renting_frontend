require 'rest-client'

class User < ApplicationRecord
	def get_user (id)
		users = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/users/" + id))
		return users
	end

	def create_user(email, password, password_confirmation, user_type, display_name)

    user = RestClient.post( (ENV["BACK_END_URL"] + "/user"),  { :user => { :email => email, :password => password, :password_confirmation => password_confirmation, :user_type => user_type, :display_name => display_name }}, {content_type: :json, accept: :json})

		return user
	end

	def update_user(id, password, display_name)

    user = RestClient.put( (ENV["BACK_END_URL"] + "/user/" + id),  { :user => { :password => password, :display_name => display_name }}, {content_type: :json, accept: :json})

		return user
	end

end
