#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'node.rb'

# represents the full linked list-objects
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = node(value)
    @head.nil? ? @head = node : @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = node(value)
    @head.nil? ? @tail = node : node.next_node = @head
    @head = node
    @size += 1
  end

  def at(index)
    return nil if @head.nil? || !index_valid?(index)

    node = @head
    (0..index).each do |i|
      return node if i == index

      node = node.next_node
    end
    nil
  end

  private

  def index_valid?(index)
    index.is_a?(Integer) && index < @size && !index.negative?
  end

  def node(value)
    Node.new(value)
  end
end
