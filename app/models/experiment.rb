class Experiment < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch
end
