class PeriodValidator < ActiveModel::Validator
  def initialize(options= {})
    super({ from: :from, to: :to }.merge!(options))
  end

  def validate(record)
    from = record.read_attribute_for_validation(options[:from])
    to = record.read_attribute_for_validation(option[:to])

    if to < from
      record.errors.add(:base, "Period from #{from} to #{to} is invalid")
    end
  end
end
