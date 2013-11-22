class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  attr_accessible :account, :password, :password_confirmation
end
