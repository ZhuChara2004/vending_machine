# frozen_string_literal: true

require "./lib/models.rb"

class CashRegister
  attr_reader :coins

  INITIAL_COINS = [
    { coin: Model::Coin.new(0.25), quantity: 5},
    { coin: Model::Coin.new(0.50), quantity: 5 },
    { coin: Model::Coin.new(1), quantity: 5 },
    { coin: Model::Coin.new(2), quantity: 5 },
    { coin: Model::Coin.new(3), quantity: 5 },
    { coin: Model::Coin.new(5), quantity: 5 }
  ]

  def initialize
    @coins = generate_coins
  end

  def deposit(inserted_coins: [])
    inserted_coins.each { |coin|  }
  end

  private

  def generate_coins
    Hash[
      INITIAL_COINS.map do |coin|
        [coin[:coin].value, Array.new(coin[:quantity], coin[:coin])]
      end
    ]
  end

  def available_coins
    @coins.map { |value, coins_array| { value: value, quantity: coins_array.size } }
          .sort_by { |item| item[:value] }.reverse
  end

  def split_change(amount)
    return {} if amount.zero?

    change = {}
    change_to_split = amount
    available_coins.each do |coin|
      value = coin[:value]
      quantity = coin[:quantity]

      next if value > change_to_split

      number_of_coins, remainder = change_to_split.divmod(value)
      change[value] = number_of_coins if number_of_coins > 0 && quantity > 0
      change_to_split = remainder

      break if change_to_split.zero?
    end
    change if change_to_split.zero?
  end
end
