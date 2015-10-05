class Record < ActiveRecord::Base
  has_and_belongs_to_many :services
  belongs_to :user
end
