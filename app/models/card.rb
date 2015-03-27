class Card < ActiveRecord::Base
  before_validation :review_date

  validates :original_text,
            :translated_text,
            :review_date,
            presence: true

  validate :original_and_translated_are_different

  def original_and_translated_are_different
    if normalize(original_text) == normalize(translated_text)
      errors.add(I18n.t("card.original"), I18n.t("card.original_translated"))
      errors.add(I18n.t("card.translated"), I18n.t("card.translated_original"))
    end
  end

  def review_date
    self.review_date = Time.now + 3.days
  end

  protected

  def normalize(name)
    Russian.translit(name).downcase.to_s
  end
end
