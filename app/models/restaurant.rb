class Restaurant < ApplicationRecord
  # associations
  # validations
  # validates :column_name, whatever_validations...
  validates :name, presence: true
end
