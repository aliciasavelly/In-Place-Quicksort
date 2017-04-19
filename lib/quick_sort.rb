class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1

    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    partition_idx = QuickSort.partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, partition_idx - start, &prc)
    QuickSort.sort2!(array, start + partition_idx + 1, length - partition_idx - 1, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    partition_idx = start

    (start + 1...start + length).each do |n|
      if prc.call(array[n], array[start]) == -1
        array[n], array[partition_idx + 1] = array[partition_idx + 1], array[n]
        partition_idx += 1
      end
    end

    array[start], array[partition_idx] = array[partition_idx], array[start]
    partition_idx
  end
end
