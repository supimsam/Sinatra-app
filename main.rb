require 'sinatra'
require 'sinatra/activerecord'
require './models'


set :database, "sqlite3:my_table.sqlite3"

get '/' do 
	@user = User.all
	erb :signup
end

get '/home' do 
	erb :home
end 

get '/profile' do
	erb :profile
end


post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		redirect '/home'
	else
		redirect '/signup'
	end

end 