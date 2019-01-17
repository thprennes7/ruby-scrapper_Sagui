# frozen_string_literal = true

require_relative '../lib/deputies.rb'

describe "should return an array containing a hash with first name and last name" do
    it "should be an array" do
        expect(deputies_full_name.class).to eq(Array)
    end

    it "should be a hash" do
        expect(deputies_full_name[0].class).to eq(Hash)
    end

    it "should return true" do
        expect(deputies_full_name[0].has_key("first_name")).to eq("true")
    end
end

describe "should return a hash with emails" do
    it "should be a hash" do
        expect(deputies_email[0].class).to eq(Hash)
    end

    it "should contain a @" do
        expect(deputies_email[0].include? "@").to eq(true)
    end
end

describe "should have an array containing a hash with first name, last name and email" do
    it "should be an array" do
        expect(deputies_full_name.class).to eq(Array)
    end

    it "should be a hash" do
        expect(deputies_full_name[0].class).to eq(Hash)
    end

    it "should return true" do
        expect(deputies_full_name[0].has_key("first_name")).to eq("true")
    end

    it "should return true" do
        expect(deputies_full_name[0].has_key("last_name")).to eq("true")
    end

    it "should return true" do
        expect(deputies_full_name[0].has_key("email")).to eq("true")
    end
end

