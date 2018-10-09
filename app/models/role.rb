class Role < ApplicationRecord
  has_many :user, dependent: :restrict_with_error
  
  after_initialize :set_defaults
  before_destroy :check_for_users
  
  enum permission_levels: [:restricted, :default, :reviewer, :admin]
  
  validates :title, 
    presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 2, maximum: 100}

  validates :permission_create,
    inclusion: {in: permission_levels.keys}
  
  validates :permission_view,
    inclusion: {in: permission_levels.keys}
  
  validates :permission_update,
    inclusion: {in: permission_levels.keys}
    
  validates :permission_delete,
    inclusion: {in: permission_levels.keys}
    
  validates :permission_send_notifications,
    inclusion: {in: permission_levels.keys}
  
  validate :single_default
  validate :active_default
  
  # Ensure only one role is default
  def single_default
    if Role.where(default: true).where.not(id: self.id).count >= 1 and self.default
      errors.add(:base, 'Only one role can be designated as default')
    end
  end
  
  # Ensure the default role is also active
  def active_default
    if self.default and !self.active
      errors.add(:base, 'Inactive role cannot also be designated as default')
    end
  end
  
  # Check if the role is assigned to any users
  def check_for_users
    if self.user.count > 0
      errors.add(:role, 'Cannot be delete while assigned to a user')
      false
    end
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