class Album < ActiveRecord::Base
   mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true
   has_many :images
   belongs_to :user
end
