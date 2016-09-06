require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./bbs.db"
  )

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class Comment < ActiveRecord::Base
end

get '/' do
  @comments = Comment.order("id desc").all
  erb :index
end

post '/new' do
  Comment.create(:body => params[:body],:username => params[:username])
  redirect '/'
end

post '/delete' do
  Comment.find(params[:id]).destroy
end





=begin

get '/' do
  "hello world"
end

get '/about2' do
  "about this site page 2"
end

get '/hello/:name' do
  "hello #{params[:name]}"
end

get '/hello/:name' do |n|
  "hello #{n}"
end

get '/hello/:fname/?:lname?' do |f,l|
  "hello #{f} #{l}"
end

get '/from/*/to/*' do |f,t|
  "from #{f} to #{t}"
end

get %r{/user/([0-9]*)} do |i|
  "user id = #{i}"
end

get '/' do
  erb :index
end

get '/:name' do |n|
  #"Hello #{n}"
  @name=n
  @title="main index"
  erb :index
end



before '/admin/*'do
  @msg = "admin area!"
end
before do
  @author = "jun"
end
after do
  logger.info "page displayed successfully"
end
helpers do
  def strong(s)
    "<strong>#{s}</strong>"
  end
end

get '/' do
  @title = "main index"
  @content = "main content by " + @author
  erb :index
end

get '/about' do
  @title = "about site page"
  @content = "this page is ... by " + strong(@author)
  @email = "jun@gmail.com"
  erb :about
end


=end