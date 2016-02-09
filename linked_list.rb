class LinkedList
  def initialize
    @head = nil
    @tail = @head
  end

  def append(data)
    node = New.node(data)
    if @tail
      @tail.next = node
      @tail = node
    else
      @head, @tail = node
    end
  end
end
