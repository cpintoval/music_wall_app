# Homepage (Root path)
enable :sessions

get '/' do
  # @background_class = "wall"
  erb :index
end

get '/songs' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @songs = Song.all
    erb :'songs/index'
  else
    redirect '/'
  end
end

get '/songs/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @song = Song.new
    erb :'songs/new'
  else
    redirect '/'
  end
end

post '/songs' do
  
  if session[:user_id]
    @user = User.find(session[:user_id])
    if params[:url].empty?
      url_var = "http://gadgtmag.com/media/uploads/2012/10/album-art-missing.png"
    else
      url_var = params[:url]
    end

    @song = Song.new(
      title: params[:title],
      author: params[:author],
      url: url_var,
      user_id: session[:user_id]
    )
    if @song.save
      redirect '/songs'
    else
      erb :'songs/new'
    end
  else
    redirect '/'
  end
end

get '/songs/:id' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @song = Song.find params[:id]
    erb :'songs/show'
  else
    redirect '/'
  end
end

get '/user/new' do
  @user = User.new
  erb :'users/signup'
end

post '/user' do
  @user = User.new(
    first_name: params[:firstname],
    last_name: params[:lastname],
    username: params[:username],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/songs'
  else
    erb :'users/signup'
  end
end

post '/session' do
  if @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    session[:user_id] = @user.id
    redirect '/songs'
  else
    "bad login"
    # Authentication Error
  end
end

post '/logout' do 
  session.delete(:user_id)
  redirect '/'
end

post '/vote' do 
  if session[:user_id]
    @vote = Vote.create(
      user_id: session[:user_id]
      
    )
  else
    "can't vote while not logged in"
  end
end