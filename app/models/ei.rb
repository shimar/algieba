class Ei < TransactionalFunction

  @@function_points = {
    low:     3,
    average: 4,
    high:    6,
  }.freeze

  def function_point
    @@function_points[complexity]
  end

end

