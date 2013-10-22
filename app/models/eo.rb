class Eo < TransactionalFunction

  @@function_points = {
    low:     4,
    average: 5,
    high:    7,
  }.freeze

  def function_point
    @@function_points[complexity]
  end

end
