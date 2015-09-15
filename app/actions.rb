# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  if session[:user_id] == nil
    session[:error] = true
    redirect '/login'
  end
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url]
    # uploaded_by: 
    )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

get '/artists/:artist' do
  @songs = Song.where(artist:params[:artist])
  @song = @songs.first
  erb :'artists/all'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end


get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
  if @user.save
    redirect '/songs'
  else
    erb :'users/new'
  end
end

get '/login' do
  @user = User.new
  erb :'users/login'
end

post '/login' do
  if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    session[:user_id] = @user.id
    binding.pry
    redirect '/songs'
  else
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end



