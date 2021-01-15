class Map

    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |subarr| 
            if subarr[0] == key 
                puts "Updating Old Key Value  [#{subarr[0]}, #{subarr[1]}]  to New Key Value given  [#{subarr[0]}, #{value}]  "
                subarr[1] = value
                return
            end
        end

        @map << [key, value] 
    end

    def get(key)
        @map.select do |subarr| 
            if subarr[0] == key
                return subarr[1] 
            end
        end

        return "Key not found"
    end

    def delete(key)
        @map.each.with_index do |subarr, i| 
            if subarr[0] == key 
                return "#{@map.delete_at(i)} has been deleted"
                # return puts "#{@map.delete_at(i)} has been deleted"
            end
        end

        return "Key not found"
    end

    def show
        @map
    end

end

# new_map = Map.new
# p new_map
# new_map.set(2, "hello")
# p new_map
# new_map.set(3, "world")
# new_map.set(4, 8)
# new_map.set([], {})
# p new_map
# new_map.set(2, "check")
# p new_map
# p new_map.show
# p new_map.get(55)
# p new_map.delete(1)