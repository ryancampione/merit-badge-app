class User < ApplicationRecord
  belongs_to :role
  
  include Friendlyable
 
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
  
  validates :role_id,
      presence: true
      
end
