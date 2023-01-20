class Company < Individual
  VALID_CNPJ_REGEX = /^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/

  validates :documentation, format: { with: VALID_CNPJ_REGEX }
end