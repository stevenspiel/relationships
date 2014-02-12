get '/' do
  erb :index
end

post '/process' do
  filename = FetchPictures.input(params[:starting], params[:scale])
  redirect '/file/' + filename
end

get '/file/:filename' do
  @fb_info = Parse.csv(params[:filename])
  erb :csv_output
end
