class User < ApplicationRecord
  include Friendlyable
  
  belongs_to :role, optional: true
  
  after_initialize :set_default_role
  
  # Include default devise modules. Others available are:
  # :timeoutable, :omniauthable
  devise :database_authenticatable, 
    :registerable, 
    :confirmable, 
    :lockable,
    :recoverable,
    :rememberable,
    :validatable
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        
  validates :email,
      presence: true,
      uniqueness: {case_sensitive: false},
      length: {maximum: 105},
      format: {with: VALID_EMAIL_REGEX}
  
  # Assign user default role
  def set_default_role
    if Role.where(default: true).count > 0
      self.role ||= Role.where(default: true).first
    end
  end
end
