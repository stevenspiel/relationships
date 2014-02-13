get '/' do
  erb :index
end

post '/insert_info' do
  puts params
  if params[:singles]
    params[:singles].each do |single|
      Single.create!(fb_id: single[1][:id], pic_url: single[1][:url]);
    end
  end
  if params[:couples]
    params[:couples].each do |couple|
      themself = Single.create(fb_id: couple[1][:id], pic_url: couple[1][:selfUrl])
      partner = Single.create(pic_url: couple[1][:partnerUrl])
      Couple.create!(original_fb_id: couple[1][:id], couple_pic: couple[1]["couplePicUrl"], self_id: themself.id, partner_id: partner.id)
    end
  end
  # TODO: add photos to folder for storage, name being their id
end

post '/get_pictures' do
  start = params[:starting].to_i
  finish = start + 100
  redirect "/get_pictures/#{start}/#{finish}"
end

get '/get_pictures/:start/:finish' do
  @range = (params[:start].to_i..params[:finish].to_i).to_a
  erb :choose_pictures
end
