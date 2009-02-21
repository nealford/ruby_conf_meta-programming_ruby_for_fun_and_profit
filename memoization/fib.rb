class Fib
  def fib(num)
    puts num
    if num == 0
      0
    else if num == 1
      1
    else
      fib(num - 1)
  end
end
