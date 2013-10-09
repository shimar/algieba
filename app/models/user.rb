class User < ActiveRecord::Base

  has_secure_password

  has_many :softwares

  validates :email,
  presence: true,
  uniqueness: true,
  confirmation: true

  validates :password,
  presence: true,
  confirmation: true

end
