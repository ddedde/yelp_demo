class Review < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
