class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # associations
  # validations
  # validates :column_name, whatever_validations...
  validates :name, presence: true
end
