class Seminar < ApplicationRecord
  has_many :bookings
  validates :title, presence: true
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :recent, -> { order('created_at DESC') }
  scope :published, -> { where(is_hidden: false) }

  STATUS = ["draft","sem","camp"]
  validates_inclusion_of :status, :in => STATUS

end
