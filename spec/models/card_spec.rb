require 'rails_helper'
require 'spec_helper'

RSpec.describe Card, type: :model do
  it 'check translation' do
    card = Card.new(original_text: "дом")
    expect(card.check_translation("вигвам")).to be false
  end

  it 'should check correct translation with strange case' do
    card = Card.new(original_text: "Дом На ХоЛме", translated_text: "hause")
    expect(card.check_translation("дОм на ХолмЕ")).to be true
  end

  it 'set review_date in fields with the same values not work' do
    card = Card.new(original_text: "home", translated_text: "home", review_date: Date.today)
    expect(card.update_review_date!).to be false
  end

  it 'should set corrected review_date' do
    card = Card.new(original_text: "hause", translated_text: "hauses", review_date: Date.today)
    expect(card.update_review_date!).to be true
  end

  it 'should have valid text' do
    expect(Card.new(original_text: "Собака", translated_text: "Dog", review_date: Date.today)).to be_valid
  end

  it 'incorrect value in fields not saved' do
    expect(Card.new(original_text: "ДоМ", translated_text: "дОм", review_date: Date.today)).not_to be_valid
  end
end
