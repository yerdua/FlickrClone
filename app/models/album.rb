# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  name        :string(255)      not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :description, :name, :owner_id
  
  validates :name, :presence => true
  
  belongs_to :owner, :class_name => 'User'
  has_many :album_inclusions
  has_many :photos, :through => :album_inclusions
end
