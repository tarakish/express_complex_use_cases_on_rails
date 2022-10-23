class Person
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :name, :age

  before_validation :normalize_name, if: -> { name.present? }

  validates :name, presence: true, length: { maximum: 100 }
  validates_numericality_of :age, greater_than_or_equal_to: 0

  private

  def normalize_name
    self.name = name.downcase.titleize
  end
ed