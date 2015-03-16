module Scopes
  def self.included(base)
    base.class_eval do
      def self.recent(limit)
        self.order('created_at DESC').limit(limit) 
      end
    end
  end
end

ActiveRecord::Base.send(:include, Scopes)