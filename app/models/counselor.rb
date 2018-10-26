class Counselor < ApplicationRecord
  
  validates :name, 
    presence: true, 
    length: {minimum: 3, maximum: 75}
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {maximum: 105},
    format: {with: VALID_EMAIL_REGEX}
  
  VALID_PHONE_NUMBER_REGEX = /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
  
  validates :phone,
    format: {with: VALID_PHONE_NUMBER_REGEX}
  
  enum status_options: [:active, :inactive, :unknown]

  validates :unit_number,
    length: {maximum: 5}

  validates :status,
    presence: true,
    inclusion: {in: status_options.keys}
    
  before_save {
    self.name = name.strip
    self.email = email.downcase
  }  
end
