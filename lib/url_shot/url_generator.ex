defmodule UrlShot.UrlGenerator do
  @chars "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    <> "1234567890"
    |> String.split("", trim: true)

  def generate do
    Enum.reduce((1..6), [], fn (_i, acc) ->
      [Enum.random(@chars) | acc]
    end) |> Enum.join("")
  end
end
