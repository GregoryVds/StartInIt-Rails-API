module Exercisable
  extend ActiveSupport::Concern

  included do
    has_one :exercise, as: :exercisable
    accepts_nested_attributes_for :exercise
    validates_presence_of :exercise
    after_destroy :destroy_exercise # Not very pretty but it avoids circular "dependent: :destroy" issues.
  end

  def destroy_exercise
    exercise.destroy if exercise && !exercise.destroyed?
  end

end