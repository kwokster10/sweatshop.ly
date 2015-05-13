require_relative "../lib/connection"

class Shirt < ActiveRecord::Base
	belongs_to :buyer
end