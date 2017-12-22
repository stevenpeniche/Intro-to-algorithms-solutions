def swap(array, from, to)
  temp = array[to]
  array[to] = array[from]
  array[from] = temp
end

def heapify(array, i, max)
  while i < max
    parent_index = i
    left_child_index = (2 * i) + 1 # index of parent's left child node
    right_child_index = left_child_index + 1 # index of parent's right child node

    # if left child node exist && is greater than current parent
    if left_child_index < max && array[left_child_index] > array[parent_index]
      parent_index = left_child_index
    end

    # if right child node exist && is greater than current parent
    if right_child_index < max && array[right_child_index] > array[parent_index]
      parent_index = right_child_index
    end

    if parent_index === i # true, if parent index didn't change
      return
    end

    swap(array, i, parent_index)
    i = parent_index
  end
end

def build_max_heap(array)
  i = ((array.length / 2) - 1).floor

  while i >= 0
    heapify(array, i, array.length)

    i -= 1
  end
end

def heapsort(array)
  build_max_heap(array)

  last_index = array.length - 1
  while last_index > 0
    swap(array, 0, last_index)

    heapify(array, 0, last_index)

    last_index -= 1
  end

  array
end

data = Array(1..100).shuffle
p "Before sort: #{data}"
p "After sort: #{heapsort(data)}"
