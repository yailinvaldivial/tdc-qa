module DataGenerator
  #Genera numeros aleatorios, pasando la cantidad de cifras y el tipo de dato
  def generate_random_number(num_digits, data_type)
    if data_type == :integer
      # Generate a random integer with the specified number of digits
      min_value = 10 ** (num_digits - 1)
      max_value = (10 ** num_digits) - 1
      rand(min_value..max_value)
    elsif data_type == :float
      # Generate a random float with the specified number of decimal places
      rand.round(num_digits)
    else
      # Unsupported data type
      raise ArgumentError.new("Unsupported data type")
    end
  end

end
World(DataGenerator)