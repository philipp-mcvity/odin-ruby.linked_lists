#!/usr/bin/env ruby
# frozen_string_literal: true

# instantiates nodes for linked lists
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
