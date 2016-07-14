
def range(first, last)
  return [first] if first == last
  [first] + range(first + 1, last)
end

def sum_rec(arr)
  return arr.first if arr.length == 1
  arr.pop + sum_rec(arr)
end

def sum_it(arr)
  arr.inject(:+)
end

def exponent1(base, power)
  return 1 if power == 0
  exponent1(base, power - 1) * base
end

def exponent2(base, power)
  return 1 if power == 0

  if power.even?
    new_base = exponent2(base, power/2)
    new_base * new_base
  elsif
    new_base = exponent2(base, (power - 1) / 2)
    base * new_base * new_base
  end
end
class Array
  def deep_dup
    duplicate = []
    self.each do |el|
      if el.is_a?(Array)
        duplicate << el.deep_dup
      else
        duplicate << el
      end
    end

    duplicate
  end
end


def fibonacci(num)
  return [1, 1].take(num) if num < 3
  prev_fib = fibonacci(num - 1)
  prev_fib << prev_fib[-1] + prev_fib[-2]
end

def bsearch(arr, target)
  return nil if arr.empty?
  mid = arr.length / 2
  case arr[mid] <=> target
  when 1
    bsearch(arr.take(mid), target)
  when 0
    mid
  when -1
    prev_bsearch = bsearch(arr.drop(mid + 1), target)
    return nil if prev_bsearch.nil?
    mid + 1 + prev_bsearch
  end
end


def merge_sort(arr)
  return arr if arr.length < 2
  mid = arr.length / 2
  left, right = arr.take(mid), arr.drop(mid)
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged = []
  while left.length > 0 && right.length > 0
    case left.first <=> right.first
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged + left + right

end


def subsets(arr)
  return [arr] if arr.empty?
  prev_subset = subsets(arr[0..-2]) #=> [[], [1]]
  prev_subset + prev_subset.map { |el| el += [arr.last] }
end



def make_change(money, coins)
  change = []
  return change if money == 0
  (money/coins[0]).times {change << coins[0]}
  remaining_money = money % coins[0]
  change + make_change(remaining_money, coins[1..-1])
end


require 'byebug'
def make_change_better(money, coins)
  # debugger
  return [] if money == 0
  best_change = []


  coins.each do |coin|
    next if money < coin

    change = [coin] + make_change_better(money - coin, coins)
    if best_change.empty? || best_change.length > change.length
      best_change = change
    end
  end
  best_change

end

# make_change_better(0, [1, 5, 10])
# def make_change_better(money, coins)
def new_change(money, coins)
  change = []
  best_change = []
  return best_change if money == 0
  coins.each do |coin|
    next if money < coin
    money -= coin
    change << coin
    current_change = (change += make_change_better(money, coins))
    best_change = current_change.size < best_change.size ? current_change : best_change
  end

end
