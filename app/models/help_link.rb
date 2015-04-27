class HelpLink < ActiveRecord::Base
  belongs_to :exercisable, polymorphic: true, inverse_of: :help_links
  validates_presence_of :url, :description

  ADMIN_PERMITTED_PARAMS = [help_links_attributes: [:id, :url, :description, :_destroy]]
end
