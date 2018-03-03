class Review < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  has_many   :pics,
             :dependent => :destroy

  belongs_to :user

  belongs_to :restaurant

  # Indirect associations

  # Validations

  validates :num_stars, :numericality => { :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1 }

end
