# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  
  nilify_blanks :before => :validation
  
  attr_accessor :login
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login, :name, :password,
                  :password_confirmation, :remember_me
                  
                  
  validates :name, :password, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :email, :uniqueness => { 
            :case_sensitive => false,
            :allow_nil => true
            }
            
  has_many :albums, :foreign_key => :owner_id, :inverse_of => :owner
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  
  has_many :photos, :foreign_key => :owner_id
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value",
        { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def is_friend?(other_user)
    other_user.friend_ids.include?(self.id)
  end
  
  def email_required?
    false
  end
end
