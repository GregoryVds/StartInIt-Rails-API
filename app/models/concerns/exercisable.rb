module Exercisable
  extend ActiveSupport::Concern

  included do
    has_one :exercise, as: :exercisable
    has_many :help_links, as: :exercisable, dependent: :destroy
    accepts_nested_attributes_for :exercise, :help_links
    validates_presence_of :exercise
    after_destroy :destroy_exercise # Not very pretty but it avoids circular "dependent: :destroy" issues.
  end

  def destroy_exercise
    exercise.destroy if exercise && !exercise.destroyed?
  end

end
