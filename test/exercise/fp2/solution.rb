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
      def my_map(&block)
        new_array = MyArray.new
        function = ->(acc, element) { acc << block.call(element) }
        MyArray.new(my_reduce(new_array, &function))
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, item|
          item.nil? ? acc : acc << item
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        first, *rest = self
        acc = acc.nil? ? first : block.call(acc, first)
        MyArray.new(rest).my_reduce(acc, &block)
      end
    end
  end
end
