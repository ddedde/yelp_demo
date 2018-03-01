class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
