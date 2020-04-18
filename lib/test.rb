#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'linked_list.rb'

le_list = LinkedList.new
le_list.prepend(12)
le_list.prepend(33)
le_list.append(25)

p le_list
puts
puts le_list.tail.value
puts le_list.head.value
puts le_list.size
p le_list.at(1)
