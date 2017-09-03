class MyStack

  def initialize
    @store = []
    @max = nil
    @next_max = nil
    @min = nil
    @next_min = nil
  end

  def pop
    @store.pop
  end

  def push(val)
    @store << val
    if @mix.nil? || val > @max
      @next_max = @max.dup
      @max = val.dup
    elsif @next_max.nil? || val > @next_max
      @next_max = val.dup
    end
    if @min.nil? || val < @min
      @next_min = @min.dup
      @min = val.dup
    elsif @next_min.nil? || val < @next_min
      @next_min = val.dup
    end
  end

  def peek
    @store
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end
