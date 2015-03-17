class BinaryAnswer < ActiveRecord::Base
  belongs_to :exercisable, polymorphic: true, inverse_of: :binary_answers
  
  validates_presence_of :description, :exercisable

  def truthy?
    value == true
  end

  def falsy?
    value == false
  end

end