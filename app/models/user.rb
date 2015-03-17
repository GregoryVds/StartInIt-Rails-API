class User < ActiveRecord::Base  

  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :set_provider

  protected 
  
  def set_provider
    self.provider = 'email'
  end

end