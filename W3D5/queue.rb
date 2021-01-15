class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue.last
    end

end

new_queue = Quene.new
p new_queue                # => #<Queue:0x000alphanums @queue=[]
new_queue.enqueue(5)
new_queue.enqueue("hi")
new_queue.enqueue([])
p new_queue                # => #<Queue:0x000alphanums @queue=[5, "hi", [] ]
new_queue.dequeue
p new_queue                # => #<Queue:0x000alphanums @queue=[5, "hi"]
p new_queue.peek           # => "hi"