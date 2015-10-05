class Service < ActiveRecord::Base
  has_and_belongs_to_many :records
  has_many :childs_services, class_name: "Service",
           foreign_key: "service_id"
  belongs_to :parent_service, class_name: "Service"

  validates :name, presence: true
  validates :service_id, :numericality => { :greater_than_or_equal_to => 0 }
end
