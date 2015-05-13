require 'sinatra'
require 'pry'

require_relative 'models/shirt'
require_relative 'models/buyer'


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
		name: params[:editName].chomp,
		image: params[:editImage].chomp,
		quantity: params[:editQuantity].to_i
	}
	shirt.update(editShirt)
	redirect('/admin')
end

#create a shirt
post "/shirts" do 
	id = params[:id].to_i
	name = params[:name].chomp
	image = params[:image].chomp
	quantity = params[:quantity].to_i
	Shirt.create(name: name, image: image, quantity: quantity)
	redirect("/shirts")
end

# delete a shirt
delete "/shirts/:id" do
	id = params[:id].to_i
	Shirt.find(id).destroy
	redirect("/admin")
end

#obtain all shirts by email

get '/admin/purchases' do
  buyers = Buyer.all
  shirts = Shirt.all

  emails = []

  buyers.each do |buyer|
    emails.push(buyer.email)
  end

  emails.uniq!

  erb :purchases, locals: ({buyers: buyers, shirts: shirts, emails: emails})
end













