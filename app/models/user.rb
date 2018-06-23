#require 'rest-client'

class User < ApplicationRecord
	def get_user (id)
		users = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/user/" + id.to_s))
		return users
	end

	def fblogin (uname, email)
		users = JSON.load(RestClient.post( (ENV["BACK_END_URL"] + "/fblogin"), { :email => email, :display_name => uname }, {content_type: :json, accept: :json}))
		return users
	end

	def create_user(email, password, password_confirmation, user_type, display_name)

    user = JSON.load(RestClient.post( (ENV["BACK_END_URL"] + "/user"), { :user => { :email => email, :password => password, :password_confirmation => password_confirmation, :user_type => user_type, :display_name => display_name }}, {content_type: :json, accept: :json}))

		return user
	end

	def update_user(id, password, display_name)

    user = JSON.load(RestClient.put( (ENV["BACK_END_URL"] + "/user/" + id), { :user => { :password => password, :display_name => display_name }}, {content_type: :json, accept: :json}))

		return user
	end

	def signin(email, password)
		user = JSON.load(RestClient.post( (ENV["BACK_END_URL"] + "/session"), { :email => email, :password => password }, {content_type: :json, accept: :json}))

		return user
	end

end
