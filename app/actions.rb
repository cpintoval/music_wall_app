# Homepage (Root path)
get '/' do
  # @background_class = "wall"
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  
  if params[:url].empty?
    url_var = "http://gadgtmag.com/media/uploads/2012/10/album-art-missing.png"
  else
    url_var = params[:url]
  end

  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: url_var
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end