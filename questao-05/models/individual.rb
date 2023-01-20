class Individual < ActiveRecord
  attribute :documentation

  validates :documentation, presence: true, uniqueness: { case_sensitive: false }
end