module Exercise
  module Arrays
    class << self
      def find_max(array)
        max_value = 0
        array.each{ |number| max_value = number if number > max_value }
        max_value
      end

      def replace(array)
        max_value = find_max(array)
        array.map{ |number| number >= 0 ? number = max_value : number }
      end

      def search(array, query, first = 0, last = array.length - 1)
        return -1 if first > last || query < array[first] || query > array[last]

        middle = (first + (last - first) / 2)
        return middle if array[middle] == query

        if array[middle] > query
          search(array, query, first, middle - 1)
        else
          search(array, query, middle + 1, last)
        end
      end
    end
  end
end
