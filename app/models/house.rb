#require 'rest-client'

class House < ApplicationRecord
	def get_all
		houses = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/houses"))
		return houses
	end

	def get_house_owner(owner_id)
		houses = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/houses?owner_id=" + owner_id.to_s))
		return houses
	end

	def get_house (id)
		houses = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/houses/" + id))
		return houses
	end

	def search_house(search)
		houses = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/houses/?search=" + search))
		return houses
	end

	def create_house(address, province, description, house_owner, renting_price)

    house = RestClient.post( (ENV["BACK_END_URL"] + "/houses"),  { :house => { :address => address, :province => province, :description => description, :house_owner => house_owner, :renting_price => renting_price }}, {content_type: :json, accept: :json})

		return house
	end

	def update_house(id, address, province, description, house_owner, renting_price, house_status)

    house = RestClient.put( (ENV["BACK_END_URL"] + "/houses/" + id),  { :house => { :address => address, :province => province, :description => description, :house_owner => house_owner, :renting_price => renting_price, :house_status => house_status }}, {content_type: :json, accept: :json})

		return house
	end

	def delete_house(id)
		house = RestClient.delete( (ENV["BACK_END_URL"] + "/houses/" + id) )
	end
end
