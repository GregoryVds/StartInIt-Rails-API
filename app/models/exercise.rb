class Exercise < ActiveRecord::Base
  belongs_to :track, inverse_of: :exercises
  belongs_to :exercise_data, polymorphic: true

  enum exercise_type: [:radio_buttons, :check_boxes, :fill_the_blank, :digital_logic]

  validates_presence_of :difficulty, :duration, :title, :track, :exercise_type
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_destroy :destroy_exercise_data # Not very pretty but it avoids circular "dependent: :destroy issues".

  private

  def destroy_exercise_data
    exercise_data.destroy if exercise_data && !exercise_data.destroyed?
  end
end