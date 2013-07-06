# == Schema Information
#
# Table name: photos
#
#  id                 :integer          not null, primary key
#  owner_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  description        :text
#  title              :string(255)
#

class Photo < ActiveRecord::Base
  attr_accessible :owner_id, :image, :title, :description,
                  :album_ids, :group_ids
  
  has_attached_file :image, styles: {
    thumb: '100x100',
    small: '300x300',
    medium: '800x800'
  }
  
  belongs_to :owner, :class_name => 'User'
  
  has_many :album_inclusions
  has_many :albums, :through => :album_inclusions
  
  has_many :photo_shares
  has_many :groups, :through => :photo_shares
  
  default_scope :order => 'photos.created_at DESC'
  
  validates_attachment :image,
    :presence => true,
    :content_type => { :content_type => ['image/jpg', 'image/jpeg'] }
    
  def as_json(options = {})
    super(options.merge(:methods => [:album_ids, :group_ids]))
  end
end
