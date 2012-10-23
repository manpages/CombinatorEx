defmodule CombinatorEx.MixFile do
  use Mix.Project

  def project do
    [ app: :combinatorex,
      version: String.strip(System.cmd("git describe --always --tags"),?\n),
      deps_path: "../../deps"
    ]
  end

end
