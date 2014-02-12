get '/' do
  erb :index
end

post '/insert_info' do
  params[:singles].each do |single|
    Single.create!(fb_id: single[:id], pic_url: single[:pic_url]);
  end
  params[:couples].each do |couple|
    Couple.create!(original_fb_id: couple[:id], couple_pic: couple[:couple_pic_url], self_pic: couple[:self_pic_url], partner_pic: couple[:partner_pic_url])
  end
  # TODO: add photos to folder for storage, name being their id
end

post '/get_pictures' do
  start = params[:starting].to_i
  finish = start + 100
  redirect "/get_pictures/#{start}/#{finish}"
end

get '/file/:filename' do
  @fb_info = Parse.csv(params[:filename])
  erb :csv_output
end

get '/get_pictures/:start/:finish' do
  @range = (params[:start].to_i..params[:finish].to_i).to_a
  erb :choose_pictures
end
