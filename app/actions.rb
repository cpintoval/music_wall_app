# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do 
  erb :'songs/index'
end
