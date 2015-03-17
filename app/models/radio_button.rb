class RadioButton < ActiveRecord::Base
  has_one :exercise, as: :exercisable
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :exercise, allow_destroy: true

  before_validation :set_exercise
  after_destroy :destroy_exercise # Not very pretty but it avoids circular "dependent: :destroy" issues.
  
  private 
  
  def set_exercise
    self.exercise.exercise_type = :radio_buttons
  end

  def destroy_exercise
    exercise.destroy if exercise && !exercise.destroyed?
  end

end