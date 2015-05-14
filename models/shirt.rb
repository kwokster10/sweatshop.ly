require_relative "../lib/connection"

class Shirt < ActiveRecord::Base
	validates_presence_of :name, message: "What's the shirt name?"
	validates_presence_of :image, message: "Don't forget to supply a fancy picture!"
	validates_numericality_of :quantity, greater_than: 0, message: "How many do you have in stock?"
	validates_presence_of :price, message: "How much does this cost?"
end