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
#

class Photo < ActiveRecord::Base
  attr_accessible :owner_id, :image
  
  has_attached_file :image
  #styles are broken because of some crap with paperclip and cocaine gems
  # , styles: {
#     thumb: '100x100',
#     medium: '600x600'
#   }
  
  belongs_to :owner, :class_name => 'User'
  
  has_many :photo_shares
  has_many :groups, :through => :photo_shares
  
  validates_attachment :image,
    :presence => true,
    :content_type => { :content_type => ['image/jpg', 'image/jpeg'] }
end
