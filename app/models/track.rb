class Track < ActiveRecord::Base
  has_many :exercises, dependent: :destroy, inverse_of: :track

  validates_presence_of :description, :difficulty, :name
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  scope :recent, lambda { |count| Track.order('created_at DESC').limit(count) } 
end