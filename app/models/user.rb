class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :cards, dependent: :destroy, counter_cache: true
end
