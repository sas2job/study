module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        first, *rest = self
        rest = MyArray.new(rest)
        yield first
        return if rest.empty?

        rest.my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        new_array = MyArray.new
        my_each { |item| new_array << yield(item) }
        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new
        my_each { |item| new_array << item unless item.nil? }
        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial = nil)
        acc = initial
        my_each do |item|
          acc = acc.nil? ? item : yield(acc, item)
        end
        acc
      end
    end
  end
end
