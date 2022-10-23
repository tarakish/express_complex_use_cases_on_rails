class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, format: { with: /\A[\p{ascii}&&[^\20]]{8,72}\z/ }, confirmation: { allow_blank: true }
end