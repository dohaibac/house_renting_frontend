require 'rest-client'

class House < ApplicationRecord
	def get_all
		houses = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/houses"))
		return houses
	end

	def delete_house
		print "house deleted"
	end

	def create_house(address, province, description, house_owner, renting_price)

    house = RestClient.post( (ENV["BACK_END_URL"] + "/houses"),  { :house => { :address => address, :province => province, :description => description, :house_owner => house_owner, :renting_price => renting_price }}, {content_type: :json, accept: :json})

		return house
	end
end
