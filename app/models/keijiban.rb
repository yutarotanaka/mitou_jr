class Keijiban < ActiveRecord::Base
    belongs_to :users
    validates :content, length: { maximum: 50000 }
    mount_uploader :picture, PictureUploader
end
