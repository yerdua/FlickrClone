# == Schema Information
#
# Table name: album_inclusions
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AlbumInclusion < ActiveRecord::Base
  attr_accessible :photo_id, :album_id
  
  validates :photo, :album, :presence => true
  validates :photo_id, :uniqueness => { :scope => :album_id }
  
  belongs_to :photo
  belongs_to :album
end
