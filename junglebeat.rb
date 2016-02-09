require_relative 'node'

class JungleBeat
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
      @head = node
      @tail = node
    end
  end

  def prepend(data)
    node = Node.new(data)
    if @head
      node.next = @head
      @head = node
    else
      @head, @tail = node, node
    end

  end

  def insert(position, data)
    node = Node.new(data)
    count = 0
    if count == position
    end
  end

  if __FILE__ == $0
    list = JungleBeat.new
    list.append("first")
    list.append("second")
    list.append("third")
    list.prepend("zeroth")

    p list
  end

end
