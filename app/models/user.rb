class User < ApplicationRecord
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
    
end
