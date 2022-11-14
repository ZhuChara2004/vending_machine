# frozen_string_literal: true
require "./lib/models.rb"

class CashRegister
  attr_reader :coins

  INITIAL_COINS = [
    { coin: Model::Coin.new(0.25), quantity: 5, code: 1 },
    { coin: Model::Coin.new(0.50), quantity: 5, code: 2 },
    { coin: Model::Coin.new(1), quantity: 5, code: 3 },
    { coin: Model::Coin.new(2), quantity: 5, code: 4 },
    { coin: Model::Coin.new(3), quantity: 5, code: 5 },
    { coin: Model::Coin.new(5), quantity: 5, code: 6 }
  ]

  def initialize
    @coins = generate_coins
  end

  private

  def generate_coins
    Hash[
      INITIAL_COINS.map do |coin|
        [coin[:code], Array.new(coin[:quantity], coin[:coin])]
      end
    ]
  end

end
