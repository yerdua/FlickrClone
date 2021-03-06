# == Schema Information
#
# Table name: group_memberships
#
#  id         :integer          not null, primary key
#  group_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupMembership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  
  validates :group_id, :uniqueness => { :scope => :user_id }
  
  belongs_to :group
  belongs_to :user
end
