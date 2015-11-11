#!/usr/bin/env ruby
require 'optparse'
require 'optparse/time'
require 'ostruct'
require_relative './primer'

class PrimeCli

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: cli.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # Mandatory argument.
      opts.on("-m", "--max MAX_NUMBER", Integer,
              "Require the MAX_NUMBER before executing your script") do |max|
        options.max = max 
      end

      opts.separator ""

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end

    opt_parser.parse!(args)
    options
  end  # parse()

end  # class PrimeCli

options = PrimeCli.parse(ARGV)
primer = Primer.new(options.max)
primer.print_multi_table
