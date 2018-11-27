class User < ActiveRecord::Base
  has_many :experiments
  has_secure_password
end
