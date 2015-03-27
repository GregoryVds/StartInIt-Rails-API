class FillTheBlank < ActiveRecord::Base
  include Exercisable
  has_many :questions, dependent: :destroy, inverse_of: :fill_the_blank
  accepts_nested_attributes_for :questions, allow_destroy: true

  validate do 
    check_questions_count
  end

  private

  def check_questions_count
    unless questions_count_valid?
      errors.add(:base, "A FillTheBlank-type exercise must have at least 1 question.")
    end
  end

  def questions_count_valid?
    questions.reject(&:marked_for_destruction?).size > 0
  end

end