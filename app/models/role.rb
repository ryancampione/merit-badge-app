class Role < ApplicationRecord
  after_initialize :set_defaults
  
  PERMISSION_LEVELS = %w(restricted default reviewer admin)
  
  validates :title, 
    presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 2, maximum: 100}

  validates :permission_create,
    inclusion: {in: PERMISSION_LEVELS}
  
  # Ensure only one role is list as default
  def single_default
    
  end
  
  def set_defaults
    self.permission_create ||= :default
    self.permission_view ||= :default
    self.permission_update ||= :default
    self.permission_delete ||= :restricted
    self.permission_send_notifications ||= :restricted
    self.default ||= false
    self.active ||= false
  end
end