class User < ActiveRecord::Base  

  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :recent, lambda { |count| User.order('created_at DESC').limit(count) } 

  before_validation :set_provider

  protected 
  
  def set_provider
    self.provider = 'email'
  end

end
