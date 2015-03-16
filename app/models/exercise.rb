class Exercise < ActiveRecord::Base
  belongs_to :track, inverse_of: :exercises

  enum exercise_type: [:radio_buttons, :check_boxes, :fill_the_blank, :digital_logic]

  validates_presence_of :difficulty, :duration, :title, :track, :exercise_type
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end