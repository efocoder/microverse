class User < ApplicationRecord
  validates :id, :email, :first_name, :last_name, :created_at, :status,  presence: true
  validates_uniqueness_of :email, :id

  enum status: { Active:1, Inactive: 0 }
end
