class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attrubute, value)
    unless value =- URI::MailTo::EMAIL_REGEXP
      record.errors.add(attribute, :invalid, options.merge(value: value))
    end
  end
end