require 'pry'
require_relative 'node'

class LinkedList

  def initialize(values)
    separate_values(values)
    create_head
    create_links
  end

  def append(values)
    separate_values(values)
    create_links
    @separated.size
  end

  def prepend(values)
    temp = @head
    separate_values(values)
    create_head
    create_links
    @current.link = temp
    @separated.size + 1
  end

  def all
    all_nodes = []
    @current = @head
    all_nodes << @head.data
    while @current.link != nil
      @current = @current.link
      all_nodes << @current.data
    end
    all_nodes.join(" ")
  end

  def count
    @count = 1
    @current = @head
    while @current.link != nil
      @count +=1
      @current = @current.link
    end
    @count
  end

  def include?(value)
    @current = @head
    while @current
      return true if value == @current.data
      @current = @current.link
    end
  end

  def play
    `say -r 500 -v Boing #{all}`
  end

  def pop(number)
  end

# other methods
  def separate_values(values)
    @separated = []
    values.split.each do |value|
      @separated << value
    end
  end

  def create_head
    @head = Node.new(@separated[0])
    @current = @head
    @separated = @separated[1..-1]
  end

  def create_links
    @current = @head
    @separated.each do |value|
      while @current.link != nil
        @current = @current.link
      end
      @current.link = Node.new(value)
      @current = @current.link
    end
  end

  # list = LinkedList.new("first second third")
  # p list.all
  # list.append("fourth fifth")
  # p list.all
  # list.prepend("zeroth")
  # p list.all

end
