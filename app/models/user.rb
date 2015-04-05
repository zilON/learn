class User < ActiveRecord::Base
  has_many :cards, dependent: :destroy, counter_cache: true
end
