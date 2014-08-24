require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'
require './song'

get('/styles.css'){ scss :styles }

configure do
	enable :sessions
	set :username, 'frank'
	set :password, 'sinatra'
end

get '/' do
	slim :home
end

get '/about' do
	@title = "All About This Website"
	slim :about
end

get '/contact' do
	slim :contact
end

not_found do
	slim :not_found
end

put '/songs/:id' do
	song = Song.get(params[:id])
	song.update(params[:song])
	redirect to("/songs/#{song.id}")
end

get '/set/:name' do
	session[:name] = params[:name]
end

get '/get/hello' do
	"Hello #{session[:name]}"
end

get '/login' do
	slim :login
end

post '/login' do
	if params[:username] == settings.username && params[:password] == settings.password
		session[:admin] = true
		redirect to('/songs')
	else
		slim :login
	end
end

get '/logout' do
	session.clear
	redirect to('/login')
end