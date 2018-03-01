class Tag < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :restaurants,
             :through => :taggings,
             :source => :restaurant

  # Validations

end
