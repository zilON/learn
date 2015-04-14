class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  with_options unless: :has_authentications? do |user|
    user.validates :password, length: { minimum: 3 }
    user.validates :password, confirmation: true
    user.validates :password_confirmation, presence: true
    user.validates :email, uniqueness: true, presence: true
  end

  has_many :cards, dependent: :destroy, counter_cache: true
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def has_authentications?
    !new_record? && !authentications.empty?
  end
end
