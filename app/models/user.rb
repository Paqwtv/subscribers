# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscribes
  has_many :programs, through: :subscribes
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { maximum: 128 }
  validates :name, length: { maximum: 64 }
  accepts_nested_attributes_for :subscribes, allow_destroy: true

  scope :not_banned, -> { includes(:subscribes).where(subscribes: { banned: false }) }
end
