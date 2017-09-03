require_relative 'stack'

class StackQueue
  def initialize
    @main_stack = MyStack.new
  end

  def enqueue(val)
    @main_stack.push(val)
  end

  def dequeue
    raise 'stackqueue is empty' if @main_stack.empty?
    working_stack = MyStack.new
    working_stack.push(@main_stack.pop) until @main_stack.size == 1
    dequeued = @main_stack.pop
    @main_stack.push(working_stack.pop) until working_stack.empty?
    dequeued
  end

  def peek
    @main_stack
  end

  def size
    @main_stack.size
  end

  def empty?
    @main_stack.empty?
  end
end
