require_relative '../lib/connection'

class Buyer < ActiveRecord::Base
	validates_presence_of :email, message: "Please provide an email to purchase."
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Is this email real?"
	validates_numericality_of :p_quantity, greater_than: 0, message: "Honestly?! 0 shirts? Why are you even here?"
end


