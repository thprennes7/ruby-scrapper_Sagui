# frozen_string_literal: true

require_relative '../lib/crypto_scrapper'

describe "it should gather all cryptomoney into a hash" do
  it "return hash" do
    expect(crypto_gatherer.class).to eq(Hash)
  end

  it "should include bitcoin with good value" do
    expect(crypto_gatherer.has_key?(:BTC)).to eq(true)
    expect(crypto_gatherer[:BTC]).to eq(3634.79)
  end

  it "should at least have 2109 elements" do
    expect(crypto_gatherer.length).to be_between(2000, 2300).inclusive
  end
end
