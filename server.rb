require 'sinatra'
require 'pry'

require_relative 'models/shirt'
require_relative 'models/buyer'
require_relative 'lib/connection'


#redirect from / to show allshirts pg
get '/' do 
  redirect('/shirts')
end

#show all shirts
get '/shirts' do 
  erb :index , locals: {shirts: Shirt.all} 
end

# show one shirt
get '/shirts/:id' do
	id = params[:id].to_i
	shirt = Shirt.find(id)
	erb :show, locals: {shirt: shirt}
end

# show admin page
get '/admin' do
	shirt = Shirt.all
	erb :admin, locals: {shirts: shirt}
end


# update a single shirt
put '/shirts/:id' do
	id = params[:id].to_i
	shirt = Shirt.find(id)
	editShirt = {
		name: params[:editName],
		image: params[:editImage],
		quantity: params[:editQuantity]
	}
	shirt.update(editShirt)
	redirect('/shirts')
end