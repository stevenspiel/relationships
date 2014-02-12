require 'csv'

class FetchPictures
  def self.input(starting,scale)
    # starting = "337800000"
    p starting
    p scale_size = scale.size.to_i
    p scale = scale.to_i
    p base_number = starting[0..((scale_size + 1) * -1)]
    p range_start = starting[((scale_size + 1) * -1)..-1].to_i
    p range = (range_start..range_start + scale).to_a
    filename = "#{starting}_#{(starting.to_i + scale).to_s}.csv"

    CSV.open(filename, "w") do |csv|
      csv << ['id','account','picture']
      valid_url = range.each_with_index.map do |n,i|
        n = "%0#{scale_size}d" % n
        row_number = (i + 1).to_s
        csv << [base_number + n,"https://www.facebook.com/#{base_number + n}/", "https://graph.facebook.com/#{base_number + n}/picture?type=large"]#, "=image(#{row_number}B)"]
      end
    end
    return filename
  end
end
