require_relative 'node'

class JungleBeat
  attr_accessor :head

  def initialize(values)
    separate(values)
    create_head
    create_next_nodes
  end

  def append(values)
    separate(values)
    create_next_nodes
    @separated_values.size
  end

  def prepend(values)
    temp_head = @head
    separate(values)
    create_head
    # step_through
    create_next_nodes
    @current_node.next_node =temp_head
    @separated_values.size + 1
  end

  def all
    @all_nodes = []
    @current_node = @head
    @all_nodes << @head.value
    while @current_node.next_node
      @current_node = @current_node.next_node
      @all_nodes << @current_node.value
    end
    @all_nodes.join(" ")
  end

  def play
    `say -r 500 -v Boing #{all}`
     @all_nodes.size
  end

  def count
    @current_node = @head
    @count = 1
    while @current_node.next_node
      @count += 1
      @current_node = @current_node.next_node
    end
    @count
  end

  def include?(value)
    @current_node = @head
    while @current_node.next_node
      return true if value == @current_node.value
      @current_node = @current_node.next_node
    end
    false
  end

  def pop(num)
    if num > count
      return "I can't pop that many things"
    end
    popped_nodes = []

    num.times do
      @current_node = @head
      while @current_node.next_node.next_node
        @current_node = @current_node.next_node
      end
      popped_nodes.unshift(@current_node.next_node.value)
      @current_node.next_node = nil
    end

    popped_nodes.join(" ")
  end

  def insert(num, values)
    if num == 0
      prepend(values)
      return
    elsif num == count
      append(values)
      return
    elsif num > count
      return "CANNOT COMPUTE"
    else
      @current_node = @head
      num = num - 1
      num.times do
        @current_node = @current_node.next_node
      end
      temp = @current_node.next_node
      separate(values)

      @separated_values.each do |value|
        @current_node.next_node = Node.new(value)
        @current_node = @current_node.next_node
      end
      @current_node.next_node = temp
    end
    all
  end

  def find(num, number)
    if num + number > count
      "CANNOT COMPUTE"
    else
      found = []
      @current_node = @head
      num = num - 1
      num.times do
        @current_node = @current_node.next_node
      end

      number.times do
        found << @current_node.next_node.value
        @current_node = @current_node.next_node
      end

      found.join(" ")
    end
  end

  # helpers
  def separate(values)
    @separated_values = []
    values.split.each do |value|
      @separated_values << value
    end
  end

  def create_head
    @head = Node.new(@separated_values[0])
    @current_node = @head
    @separated_values = @separated_values[1..-1]
  end

  def create_next_nodes
    @current_node = @head
    @separated_values.each do |value|
      step_through
      @current_node.next_node = Node.new(value)
      @current_node = @current_node.next_node
    end
  end

  def step_through
    while @current_node.next_node
      @current_node = @current_node.next_node
    end
  end


  # jb = JungleBeat.new("first second fourth")
  # jb.insert(2, "third")
  # p jb.all
  # jb.prepend("boom")
  # jb.pop(9)
  # p jb

  # jb.play

end
