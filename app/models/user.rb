class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 3 }, unless: :has_authentications?
  validates :password, confirmation: true, unless: :has_authentications?
  validates :password_confirmation, presence: true, unless: :has_authentications?
  validates :email, uniqueness: true, presence: true, unless: :has_authentications?

  has_many :cards, dependent: :destroy, counter_cache: true
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  def has_authentications?
    !new_record? && !authentications.empty?
  end
end
