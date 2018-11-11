class User < ActiveRecord::Base
  has_many :experiments
end
