require 'rest-client'
class Contract < ApplicationRecord
	def get_contract (id)
		contracts = JSON.load(RestClient.get(ENV["BACK_END_URL"] + "/contracts/" + id))
		return contracts
	end

	def create_contract(house_id, user_id, contract_date_start, contract_date_end)

    contract = RestClient.post( (ENV["BACK_END_URL"] + "/contracts"),  { :contract => { :house_id => house_id, :user_id => user_id, :contract_date_start => contract_date_start, :contract_date_end => contract_date_end }}, {content_type: :json, accept: :json})

		return contract
	end

	def update_contract(id, contract_date_start, contract_date_end, contract_status)

    contract = RestClient.put( (ENV["BACK_END_URL"] + "/contracts/" + id),  { :contract => { :contract_date_start => contract_date_start, :contract_date_end => contract_date_end, :contract_status => contract_status }}, {content_type: :json, accept: :json})

		return contract
	end
end
