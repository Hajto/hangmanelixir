defmodule Hangman.ModelUtils do
  def isArrayLoaded( [ h | t] ), do: [h | t]
  def isArrayLoaded( a ) do
     IO.inspect(is_binary(a))
     []
   end
  def isAnythingLoaded(Ecto.Association.NotLoaded), do: nil
  def isAnythingLoaded( a ), do: a
end
