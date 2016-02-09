require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(data)
    node = Node.new(data)
    if @tail
      @tail.next = node
      @tail = node
    else
      @head, @tail = node
    end
  end

  def prepend(data)
    node = Node.new(data)

  end

  if __FILE__ == $0
    list = LinkedList.new
    list.append("first")
    list.append("second")
    list.append("third")

    p list.head.data
  end

end
