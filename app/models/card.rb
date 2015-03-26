
class Card < ActiveRecord::Base
  before_validation :normalize_name, :review_date

  before_save :capitalize_name

  validates :original_text,
    :translated_text,
    :review_date,
    presence: true

  validate :original_and_translated_are_different

  def original_and_translated_are_different
    if original_text == translated_text
      errors.add(I18n.t("card.original"), I18n.t("card.original_translated"))
      errors.add(I18n.t("card.translated"), I18n.t("card.translated_original"))
    end
  end
  def review_date
    self.review_date = Time.now + 3.days
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





