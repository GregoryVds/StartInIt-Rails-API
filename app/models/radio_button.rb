class RadioButton < Mcq

  validate do
    check_has_one_valid_answer
  end

  private 

  def check_has_one_valid_answer
    unless has_one_valid_answer?
      errors.add(:base, "A RadioButton exercise must have exactly 1 valid answer.")
    end
  end
  
  def has_one_valid_answer?
    binary_answers.reject(&:falsy?).reject(&:marked_for_destruction?).size == 1
  end
end