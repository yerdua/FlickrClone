# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :password
  validates :name, :password, :presence => true
  validates :name, :uniqueness => true
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  
  has_many :photos, :foreign_key => :owner_id
end
