# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  description  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  only_members :boolean          default(TRUE), not null
#

class Group < ActiveRecord::Base
  attr_accessible :name, :description, :only_members
  
  validates :name, presence: true
  
  has_many :memberships, :class_name => 'GroupMembership'
  has_many :members, :through => :memberships, :source => :user
  
  has_many :photo_shares
  has_many :photos, :through => :photo_shares
  
  def self.allow_non_members
    Group.where(only_members: false)
  end
  
  def has_member?(user)
    self.members.include?(user)
  end
end
