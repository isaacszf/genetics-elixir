defmodule Speller do
  @behaviour Problem
  @word "alexmendoca"

  alias Types.Chromosome

  def genotype do
    lng = String.length(@word)
    genes =
      Stream.repeatedly(fn -> Enum.random(?a..?z) end)
      |> Enum.take(lng)
    %Chromosome{genes: genes, size: lng}
  end

  def fitness_function(chromosome) do
    target = @word
    guess = List.to_string(chromosome.genes)
    String.jaro_distance(target, guess)
  end

  def terminate?([best | _]), do: best.fitness == 1
end

solution = GeneticsFramework.run(Speller)

IO.write("\n")
IO.inspect(solution)
