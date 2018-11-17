class Experiment < ActiveRecord::Base
  belongs_to :user
  belongs_to :branch

  validates :story, presence: {message: "You didn't include what you needed to!"}
  validates :title, presence: {message: "Are you trying to break the database?!"}
end
