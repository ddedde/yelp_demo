class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
