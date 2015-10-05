class User < ActiveRecord::Base

  has_many :records, dependent: :destroy
  has_many :reviews, dependent: :destroy

  include PgSearch
  pg_search_scope :search_everywhere, against: [:login, :name]

  has_many :reviews
  authenticates_with_sorcery!
  has_attached_file :avatar, styles: {medium: '300x300', thumb: '100x100', crug: 'border-radius:50%'}
  validates_attachment :avatar, content_type: {content_type: ['image/jpg','image/jpeg','image/png','image/gif']}
  validates :fio, presence: true
  validates :login, presence: true, uniqueness: true
  validates :roles, presence: true
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of :password, within: 5..255, allow_blank: true

  scope :ordering,->{order(:login)}


  def admin?
    self.roles && self.roles.include?("admin")
  end
  def master?
    self.roles && self.roles.include?("master")
  end
  def customer?
    self.roles && self.roles.include?("customer")
  end

  private
  def password_required?
    self.new_record? || password.present? || password_confirmation.present?
  end


end
