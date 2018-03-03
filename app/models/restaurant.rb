class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  has_many   :owners,
             :through => :ownerships,
             :source => :user

  has_many   :reviewers,
             :through => :reviews,
             :source => :user

  has_many   :tags,
             :through => :taggings,
             :source => :tag

  # Validations

  validates :number_of_reviews, :presence => true

  validates :number_of_reviews, :numericality => { :greater_than_or_equal_to => 0 }

end
