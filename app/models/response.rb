class Response < ApplicationRecord
  # Direct associations

  belongs_to :review

  # Indirect associations

  # Validations

  validates :content, :presence => true

end
