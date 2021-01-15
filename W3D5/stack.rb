class Stack

   def initialize
    @stack = []
   end

   def push(el)
    @stack << el
   end

   def pop
    @stack.pop
   end

   def peek
    @stack.first
   end

end

new_stack = Stack.new 
p new_stack               # => #<Stack:0x0000morealphanums @stack=[]>
new_stack.push(2)         
new_stack.push("hello")
new_stack.push({})
p new_stack             # => #<Stack:0x0000morealphanums @stack=[2, "hello", {}]>
p new_stack.pop         # => {}
p new_stack.peek        # => 2
p new_stack             # => #<Stack:0x0000morealphanums @stack=[2, "hello"]>