# == Schema Information
#
# Table name: photo_shares
#
#  id         :integer          not null, primary key
#  photo_id   :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoShares < ActiveRecord::Base
  attr_accessible :group_id, :photo_id
  
  belongs_to :group
  belongs_to :photo
end
