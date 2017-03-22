defmodule UrlGeneratorTest do
  use ExUnit.Case, async: true
  alias UrlShot.UrlGenerator

  test "generates string with length 6 and is alphanumeric" do
    url = UrlGenerator.generate

    assert String.length(UrlGenerator.generate) == 6
    assert String.match?(url, ~r/^\w+$/)
  end
end
