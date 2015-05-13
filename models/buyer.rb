require_relative '../lib/connection'

class Buyer < ActiveRecord::Base
	has_many :shirts
end
