# frozen_string_literal: true

require "spec_helper"
require "./lib/cash_register"

describe CashRegister do
  let(:cash_register) { described_class.new }

  describe "#initialize" do
    it "has a collection of coins" do
      expect(cash_register.coins).to_not be_empty

      cash_register.coins.each do |value, coins_array|
        expect(coins_array).to be_an_instance_of(Array)
        expect(coins_array).to all(be_an_instance_of(Model::Coin))
      end
    end
  end

  describe "#split_change" do
    it "splits change amount to coins" do
      expected_change = {
        1 => 1,
        0.5 => 1,
        0.25 => 1
      }

      change = cash_register.send(:split_change, 1.75)
      expect(change).to eq(expected_change)
    end

    it "returns blank hash if nothing to split" do
      expected_change = {}

      change = cash_register.send(:split_change, 0)
      expect(change).to eq(expected_change)
    end

    it "returns nil if unsplittable" do
      expected_change = nil

      change = cash_register.send(:split_change, 0.30)
      expect(change).to eq(expected_change)
    end
  end
end
