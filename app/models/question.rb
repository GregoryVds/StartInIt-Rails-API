class Question < ActiveRecord::Base
  belongs_to :fill_the_blank, inverse_of: :questions
  has_many :text_answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :text_answers, allow_destroy: true
  validates_presence_of :question

  ADMIN_PERMITTED_PARAMS = [questions_attributes: [:id, :question, :_destroy, text_answers_attributes: [:id, :answer, :_destroy]]]

  validate do
    check_text_answers_count
  end

  private

  def check_text_answers_count
    unless text_answers_count_valid?
      errors.add(:base, "A question must have at least 1 answer.")
    end
  end

  def text_answers_count_valid?
    text_answers.reject(&:marked_for_destruction?).size > 0
  end
end
