class RadioButton < ActiveRecord::Base
  # Any exercisable has a related exercise
  has_one :exercise, as: :exercisable
  accepts_nested_attributes_for :exercise
  validates_presence_of :exercise
  after_destroy :destroy_exercise # Not very pretty but it avoids circular "dependent: :destroy" issues.
  
  # A radio_button has many binary answers, some true, some false.
  has_many :binary_answers, as: :exercisable, dependent: :destroy, inverse_of: :exercisable
  has_many :valid_binary_answers, -> { where value: true }, class_name: BinaryAnswer.name, as: :exercisable, inverse_of: :exercisable
  has_many :invalid_binary_answers, -> { where value: false }, class_name: BinaryAnswer.name, as: :exercisable, inverse_of: :exercisable
  
  accepts_nested_attributes_for :binary_answers, allow_destroy: true
  
  validate do
    check_binary_answer_count
  end
  
  private 

  def destroy_exercise
    exercise.destroy if exercise && !exercise.destroyed?
  end

  def check_binary_answer_count
    unless binary_answer_count_valid?
      errors.add(:base, "A RadioButton must have at least 2 answers.")
    end
  end

  def binary_answer_count_valid?
    binary_answers.reject(&:marked_for_destruction?).size >= 2
  end

  # def binary_answer_count_valid?
  #   binary_answers.reject(&:falsy?).reject(&:marked_for_destruction?).size >= 1
  # end

end