#!/usr/bin/env ruby
require 'optparse'
require 'optparse/time'
require 'ostruct'
require_relative './primer'

#Basic option parsing, could have used something like Thor if we needed a more complex cli
class PrimeCli
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
              "The largest prime that the program will search for to print out the multipcation table") do |max|
        options.max = max 
      end

      opts.separator ""

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
raise "You must specify a max number!" unless options.max
primer = Primer.new(options.max)
primer.print_multi_table
