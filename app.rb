require 'sinatra/base'
require './lib/bookmark'
require './lib/database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/')
  end

  run! if app_file == $0
end
