class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many  :documents
  has_many  :presentations
  has_many  :psessions, :dependent => :delete_all

  serialize :groups, Array
  validates :login, presence: true, uniqueness: true
  validates :roles, presence: true
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: 5..255, allow_blank: true

  def admin?
    self.roles && self.roles.include?("admin")
  end
  def teacher?
    self.roles && self.roles.include?("teacher")
  end
  def student?
    self.roles && self.roles.include?("student")
  end

  private
  def password_required?
    self.new_record? || password.present? || password_confirmation.present?
  end
end
