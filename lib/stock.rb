require './lib/models.rb'

class Stock
  attr_reader :products

  INITIAL_PRODUCTS = [
    { product: Model::Product.new("Cola", 1.50), quantity: 5, plu: 1 },
    { product: Model::Product.new("Fanta", 1.50), quantity: 5, plu: 2 },
    { product: Model::Product.new("Sprite", 1.50), quantity: 5, plu: 3 },
    { product: Model::Product.new("Juice", 2.50), quantity: 5, plu: 4 },
    { product: Model::Product.new("Soda", 2.00), quantity: 5, plu: 5 },
    { product: Model::Product.new("Water", 1.00), quantity: 5, plu: 6 }
  ]

  def initialize
    @products = generate_products
    @coins = generate_coins
  end

  def release_product(plu)
    puts "Product unavailable" unless product_available?

    puts "Releasing product"
    products[plu].pop
  end

  def product_available?(plu)
    products[plu].any?
  end

  private

  def generate_products
    Hash[
      INITIAL_PRODUCTS.map do |product|
        [product[:plu], Array.new(product[:quantity], product[:product])]
      end
    ]
  end

end
