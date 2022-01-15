defmodule OneMax do
  @behaviour Problem

  alias Types.Chromosome

  def genotype do
    genes = for _ <- 1..42, do: Enum.random(0..1)
    %Chromosome{genes: genes, size: 42}
  end

  def fitness_function(chromosome), do: Enum.sum(chromosome.genes)

  def terminate?([best | _]), do: best.fitness == 42
end

solution = GeneticsFramework.run(OneMax)

IO.write("\n")
IO.inspect(solution)
