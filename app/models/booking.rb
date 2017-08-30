class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :seminar
  validates :content, presence: true
end
