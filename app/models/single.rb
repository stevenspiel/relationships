class Single < ActiveRecord::Base
  validates :fb_id, uniqueness: true
  validates :pic_url, presence: true
end
