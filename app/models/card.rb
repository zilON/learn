
class Card < ActiveRecord::Base
  before_validation :normalize_name
  before_save :capitalize_name

  validates :original_text,
    :translated_text,
    :review_date,
    presence: true

  validate :original_and_translated_are_different

  def original_and_translated_are_different
    if original_text == translated_text
      errors.add(:original_text, 'must be different to translated')
      errors.add(:translated_text, 'must be different to original')
    end
  end

  protected

    def normalize_name
      self.original_text = self.original_text.downcase
      self.translated_text = self.translated_text.downcase
    end
    def capitalize_name
      self.original_text = self.original_text.capitalize
      self.translated_text = self.translated_text.capitalize
    end
end





