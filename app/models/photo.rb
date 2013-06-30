# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  data       :binary           not null
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :data, :owner_id
  
  belongs_to :owner, :class_name => 'User'
  
  has_many :photo_shares
  has_many :groups, :through => :photo_shares
end
