class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
