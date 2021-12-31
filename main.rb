require "sinatra"
require "sinatra/reloader"

get "/" do
    erb(:index)
end

get "/about" do
    erb(:about)
end

get "/join" do
    erb(:join)
end

get "/projects" do
    erb(:projects)
end

get "/resources" do
    erb(:resources)
end