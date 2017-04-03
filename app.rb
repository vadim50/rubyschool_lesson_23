require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a>
	 pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@master = params[:master]

	f = File.open("./public/visit.txt", "a")
	f.write("Name: #{@username}, Phone: #{@phone}, Date: #{@datetime}, Wizard: #{@master}\n")
	f.close
	@message = "Hello #{@username} you phone #{@phone} we waiting you at #{@datetime} and Wizard: #{@master}"

	erb :checkout
end

get '/admin' do
	erb :admin
end

post '/admin' do

	@login = params[:login]
	@password = params[:password]


	if @login == 'admin' && @password == '12345'

		@f = File.open("./public/visit.txt", "r")

		erb :vizitlist
	else
		@message = "Hello, access denied!"
		erb :admin
	end
end

get '/contacts' do
	erb :contacts
end
