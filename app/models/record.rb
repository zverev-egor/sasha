class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :master, class_name: 'User'

  validates :master, presence: true
end
