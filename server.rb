require 'sinatra'
require 'pry'

require_relative 'models/shirt'

get '/' do #redirect from / to show allshirts pg
  
  redirect('/shirts')

end

get '/shirts' do #show all shirts

  erb :index , locals: {shirts: Shirt.all} 

end



