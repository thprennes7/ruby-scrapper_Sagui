# frozen_string_literal: true

require_relative '../lib/email_valdoise'

describe "should return a link to the town infos" do
  it "should return an array" do
    expect(link_fetcher.class).to eq(Array)
  end

  it "should end with .html" do
    expect(link_fetcher[0].include? ".html").to eq(true)
  end
end

describe "should fetch the e-mail adress of each town" do
  it "should contain a @" do
    expect(mail_fetcher[0].include? "@").to eq(true)
  end

  it "should have at least one dot" do
    expect(mail_fetcher[0].include? ".").to eq(true)
  end
end

describe "should fetch town names" do
  it "should return an array" do
    expect(name_fetcher.class).to eq(Array)
  end

  it "should be Ableiges at index 0" do
    expect(name_fetcher[0]).to eq("Ableiges")
  end
end

describe "should return a hash" do
  it "should be a hash" do
    expect(data_gatherer.class).to eq(Hash)
  end

  it "should have key Ableiges with good value" do
    expect(data_gatherer.has_key?("Ableiges")).to eq(true)
    expect(data_gatherer["Ableiges"]).to eq("mairie.ableiges95@wanadoo.fr")
  end
end
