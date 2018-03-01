class Ownership < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  belongs_to :user

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
