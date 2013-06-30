# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :memberships, :class_name => 'GroupMembership'
  has_many :members, :through => :memberships, :source => :user
  
  has_many :photo_shares
  has_many :photos, :through => :photo_shares
end
