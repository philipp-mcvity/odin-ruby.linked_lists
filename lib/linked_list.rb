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
    node
  end

  def prepend(value)
    node = node(value)
    @head.nil? ? @tail = node : node.next_node = @head
    @head = node
    @size += 1
    node
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

  def pop
    node = @tail
    if @size > 1
      @tail = at(@size - 2)
      @tail.next_node = nil
    else
      @head = @tail = nil
    end
    @size -= 1 unless @size.zero?
    node
  end

  def contains?(value)
    node = @head
    @size.times do
      node.value == value ? (return true) : node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    @size.times do |index|
      node.value == value ? (return index) : node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    str_ary = []
    @size.times do
      str_ary << "( #{node.value} ) -> "
      node = node.next_node
    end
    (str_ary << 'nil').join
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    (1..@size).include?(index) ? node = node(value) : (return nil)
    node.next_node = at(index)
    at(index - 1).next_node = node
    @size += 1
    node
  end

  def remove_at(index)
    if (node = at(index))
      if index.zero?
        @head = @tail = nil if @size.zero?
        @head = at(index + 1)
      else
        at(index - 1).next_node = at(index + 1)
      end
      @size -= 1
    end
    node
  end

  private

  def index_valid?(index)
    index.is_a?(Integer) && index < @size && !index.negative?
  end

  def node(value)
    Node.new(value)
  end
end
