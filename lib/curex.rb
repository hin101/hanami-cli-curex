require "curex/version"
require "hanami/cli"
require "bigdecimal"
require "money"
require "money/bank/google_currency"

Money.locale_backend = :currency
Money.default_bank = Money::Bank::GoogleCurrency.new

module Curex
  # Your code goes here...
  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end
  end

  module Commands
    extend Hanami::CLI::Registry

    class Convert < Hanami::CLI::Command
      argument :amount, required: true
      argument :from, required: true
      argument :to, required: true

      def call(amount:, from:, to:)
        money = Money.new(amount.to_d * 100, from)
        result = money.exchange_to(to)

        puts "#{amount} #{from} == #{result} #{to}"
      end
    end

    register "convert", Convert
  end
end
