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
	if params[:sort]
		shirts = Shirt.all.order(params[:sort])
	else 
		shirts = Shirt.all
	end
 	erb :index , locals: {shirts: shirts} 
end

# show one shirt
get '/shirts/:id' do
	id = params[:id].to_i
	shirt = Shirt.find(id)
	errors = {}
	erb :show, locals: {shirt: shirt, errors: errors}
end

# show admin page
get '/admin' do
	errors = {}
	shirts = Shirt.all
	erb :admin, locals: {shirts: shirts, errors: errors}
end


# update a single shirt
put '/shirts/:id' do
	id = params[:id].to_i
	shirt = Shirt.find(id)
	begin # using this to stop update if shirt is invalid
		shirt.update!({
			name: params[:editName].chomp,
			price: params[:editPrice].chomp,
			image: params[:editImage].chomp,
			quantity: params[:editQuantity].to_i
		})
		redirect('/admin')
	rescue Exception => error_message # getting error message
		errors = {message: [error_message.message.split(":")[1]]}
		shirts = Shirt.all
		erb :admin, locals: {errors: errors, shirts: shirts}
	end	

end

#create a shirt
post "/shirts" do 
	new_shirt = Shirt.new({
		name: params[:name].chomp, 
		price: params[:price].chomp, 
		image: params[:image].chomp, 
		quantity: params[:quantity].to_i 
		})
	if new_shirt.save # runs if everything's valid
		redirect("/shirts")
	else # shows errors and does not save
		errors = new_shirt.errors
		shirts = Shirt.all
		erb :admin, locals: {errors: errors, shirts: shirts}
	end	
end

# purchase a shirt and then go back to main page
post "/buyers/:shirt_id" do
	buyer = params[:email].chomp
	quantity = params[:shirt_quantity].to_i
	shirt_id = params[:shirt_id].to_i
	new_buyer = Buyer.new({email: buyer, p_quantity: quantity, s_id: shirt_id})
	shirt = Shirt.find(shirt_id)

	if new_buyer.save # if all purchase fields are valid
		spent = shirt.price * quantity
		shirt.update({quantity: shirt.quantity - quantity})
		erb :thanks, locals: {spent: spent}
	else # if any purchase field is missing, throw error
		errors = new_buyer.errors
		erb :show, locals: {shirt: shirt, errors: errors}
	end
end

# delete a shirt
delete "/shirts/:id" do
	id = params[:id].to_i
	Shirt.find(id).destroy
	redirect("/admin")
end

# obtain history of purchases sorted by email
get '/admin/purchases' do
  buyers = Buyer.all
  shirts = Shirt.all

  # making array of buyers by email unique
  emails = []
  buyers.each do |buyer|
    emails.push(buyer.email)
  end
  emails.uniq!

  erb :purchases, locals: ({buyers: buyers, shirts: shirts, emails: emails})
end





