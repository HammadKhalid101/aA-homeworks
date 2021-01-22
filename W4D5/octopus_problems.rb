# Big O-ctopus and Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(array)
    longest_fish = ''
    (0...array.length - 1).each do |i|
        ((i+1)..array.length - 1).each do |j|
            fish_1 = array[i]
            fish_2 = array[j]
            if fish_1.length < fish_2.length && fish_2.length > longest_fish.length
                longest_fish = fish_2
            elsif fish_2.length < fish_1.length && fish_1.length > longest_fish.length
                longest_fish = fish_1
            end
        end
    end
    longest_fish
end

# array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p sluggish_octopus(array) # => "fiiiissshhhhhh"

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) 
# in the Sorting Complexity Demo. Remember that Big O is classified by the dominant term.
class Array

    def merge_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    return self if self.length <= 1

    mid = self.length / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

    end

    private
    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1 
                merged << left.shift
            when 0 
                merged << left.shift
            when 1
                right.shift
            end
        end
        
        merged.concat(left)
        merged.concat(right)

        merged
    end
end

# array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p array.merge_sort { |a, b| a.length <=> b.length }[-1]

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish 
# that you have found so far while stepping through the array only once.

def clever_octopus(array)
    biggest_fish = array.first
    array.each { |fish| biggest_fish = fish if biggest_fish.length < fish.length }
    biggest_fish
end

# array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p clever_octopus(array)

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. 
# We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

def slow_dance(direction, tiles_array)
    tiles.each.with_index { |tile, i| return i if direction == tile }
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# p slow_dance("up", tiles_array)
# > 0

# p slow_dance("right-down", tiles_array)
# > 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. 
# Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

# p fast_dance("up", tiles_hash)
# > 0

# p fast_dance("right-down", tiles_hash)
# > 3