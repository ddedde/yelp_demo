class Review < ApplicationRecord
  # Direct associations

  has_many   :pics,
             :dependent => :destroy

  belongs_to :user

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
