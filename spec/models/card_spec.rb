require 'rails_helper'
require 'spec_helper'

describe Card do
  card = Card.create(original_text: "hausE SOmE ДоМ", translated_text: "hauses")
  card_bad = Card.new(original_text: "home", translated_text: "home", review_date: Date.today)

  it 'check translation' do
    expect(card.check_translation("вигвам")).to be false
  end

  it 'set review_date in fields with the same values not work' do
    expect(card_bad.update_review_date!).to be false
  end

  it 'should check correct translation with strange case' do
    expect(card.check_translation("hausE SOmE ДоМ")).to be true
  end

  it 'should set corrected review_date' do
    expect(card.update_review_date!).to be true
  end

  it 'should have valid text' do
    expect(card).to be_valid
  end

  it 'incorrect value in fields not saved' do
    expect(card_bad).not_to be_valid
  end
end
