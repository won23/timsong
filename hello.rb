require 'sinatra'
require 'sinatra/reloader' if development?

get '/hello' do
"hello Sinatra"
end

get '/frank' do
	name = "frank"
	"Hello #{name} man"
end

get '/:name' do 
	name = params[:name]
	"Hi there #{name}"
end

get '/:one/:two/:three' do
"first: #{params[:one]}, second: #{params[:two]}, third: #{params[:three]}"
end