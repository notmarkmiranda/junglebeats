class Node
  attr_accessor :data, :link

  def initialize(data = nil)
    @data = data
    @next = nil
  end

end
