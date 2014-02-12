require 'csv'

class Parse
  def self.csv(file)
    fb_info = []
    # csv_text = File.read(file)
    CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      fb_info << Hash[row.headers.zip(row.fields)]
    end
    fb_info
  end
end
