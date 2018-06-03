class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  BACKEND_URL = "http:localhost:3000"
end
