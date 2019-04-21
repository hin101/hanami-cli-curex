require "curex/version"
require "hanami/cli"

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
      def call(*)
        puts "converting.."
      end
    end

    register "convert", Convert
  end
end
