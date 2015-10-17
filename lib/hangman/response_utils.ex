defmodule Hangman.ResponseUtils do

  def jsonResponse(success, errors \\ []) do
    %{ "success" => success, "errors" => errors}
  end

end
