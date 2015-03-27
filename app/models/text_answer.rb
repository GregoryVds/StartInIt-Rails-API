class TextAnswer < ActiveRecord::Base
  belongs_to :question, inverse_of: :text_answers
  validates_presence_of :answer
end