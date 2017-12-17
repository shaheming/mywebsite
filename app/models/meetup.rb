class Meetup < ApplicationRecord
  validates :title,:meetup_time,:description, presence: true
  has_many :posts
end
