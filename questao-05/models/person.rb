class Person < Individual
  VALID_CPF_REGEX = /^\d{3}\.\d{3}\.\d{3}\-\d{2}$/

  validates :documentation, format: { with: VALID_CPF_REGEX }
end