class Album < ActiveRecord::Base
 has_many :images
 belongs_to :user
 has_one :profile_pic
end
