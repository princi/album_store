class AddAttachmentToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :attachment, :string
  end
end
