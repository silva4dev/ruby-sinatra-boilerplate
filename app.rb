require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @posts = Post.all.order(votes: :desc)
  erb :index
end

get "/posts/:id" do
  id = params[:id]
  @post = Post.find(id)
  erb :show
end

post "/posts" do
  title = params[:title]
  url = params[:url]

  post = Post.create!(title: title, url: url)

  redirect "/posts/#{post.id}"
end

post '/upvote/:id' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save

  redirect "/posts/#{post.id}"
end
