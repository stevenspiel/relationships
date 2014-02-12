class Single < ActiveRecord::Base
  validates :fb_id, uniqueness: true, presence: true
end
