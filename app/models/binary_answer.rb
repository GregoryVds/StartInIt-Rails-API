class BinaryAnswer < ActiveRecord::Base
  belongs_to :exercisable, polymorphic: true, inverse_of: :binary_answers

  validates_presence_of :description, :exercisable

  ADMIN_PERMITTED_PARAMS = [binary_answers_attributes: [:id, :description, :value, :_destroy]]

  def truthy?
    value == true
  end

  def falsy?
    value == false
  end

end
