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

  # jb = JungleBeat.new("deep dep dep deep")
  # jb.prepend("boom")
  # jb.play

end
