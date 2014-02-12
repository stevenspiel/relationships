require 'csv'

starting = "337800000"
# 337800042
distance = 100
p range_start = starting[-3..-1].to_i
range = (range_start..range_start + distance).to_a
filename = "#{starting}_#{(starting.to_i + distance).to_s}"

CSV.open(filename, "w") do |csv|
  valid_url = range.each_with_index.map do |n,i|
    n = "%03d" % n
    row_number = (i + 1).to_s
    csv << ["https://www.facebook.com/337800#{n}/", "https://graph.facebook.com/337800#{n}/picture?type=large", "=image(#{row_number}B)"]
  end
end
