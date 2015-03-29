class Card < ActiveRecord::Base
  before_validation :set_review_date, on: :create
  before_save :remove_whitespaces

  validates :original_text,
            :translated_text,
            :review_date,
            presence: true

  validate :original_and_translated_are_different

  scope :ready_to_review, -> { where("review_date <= ?", Time.zone.now).order("RANDOM()").first }

  def check_translation(text)
    if normalize(text.strip) == normalize(original_text)
      update_review_date!
    end
  end

  def update_review_date!
    update(review_date: 3.days.since)
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

  def remove_whitespaces
    self.original_text = original_text.strip
    self.translated_text = translated_text.strip
  end
end
