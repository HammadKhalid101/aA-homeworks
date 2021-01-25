class LRUCache
    def initialize(num)
        @max_size = num
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.size
    end

    def add(el)
        if @cache.include?(el)
            @cache.delete(el)
            @cache << el
        elsif count >= size
            @cache.shift
            @cache << el
        else
            @cache << el
        end
      # adds element to cache according to LRU principle
    end

    def show
        p @cache
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!

  end