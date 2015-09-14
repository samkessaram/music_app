# Homepage (Root path)
get '/' do
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
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url]
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





