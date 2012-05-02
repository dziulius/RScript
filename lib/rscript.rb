require 'ruby_parser'

module RScript
  module Nodes
    class << self
      @@nodes = {}

      def [](type)
        @@nodes[type]
      end

      def register(type, klass)
        @@nodes[type.to_sym] = klass
      end

      def make(sexp)
        Nodes[sexp.sexp_type.to_sym].new(sexp)
      end
    end
  end

  def self.parse(str)
    sexp = RubyParser.new.parse(str)
    puts Nodes.make(sexp).parse
  end
end

$: << File.dirname(__FILE__)
require 'nodes/base'
require 'nodes/block'
require 'nodes/klass'
require 'nodes/scope'

