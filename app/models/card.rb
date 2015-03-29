class Card < ActiveRecord::Base
  before_validation :set_review_date, on: :create

  validates :original_text,
            :translated_text,
            :review_date,
            presence: true

  validate :original_and_translated_are_different

  scope :ready_to_review, -> { where("review_date <= ?", Time.zone.now) }

  def update_review_date!
    update(review_date: 3.days.since)
  end

  def check_translation(text)
    normalize(text.strip) == normalize(original_text)
  end

  private

  def set_review_date
    self.review_date ||= 3.days.since # .since - .ago
  end

  def normalize(name)
    Russian.translit(name).downcase.to_s
  end

  def original_and_translated_are_different
    if normalize(original_text) == normalize(translated_text)
      errors.add(I18n.t("card.original"), I18n.t("card.original_translated"))
      errors.add(I18n.t("card.translated"), I18n.t("card.translated_original"))
    end
  end
end
