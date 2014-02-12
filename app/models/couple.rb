class Couple < ActiveRecord::Base
  validates :original_fb_id, uniqueness: true, presence: true
end
