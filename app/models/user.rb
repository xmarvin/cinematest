class User < ApplicationRecord
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: true, presence: true
  has_many :purchases
end
