defmodule Caesar do
  def main(argv) do
    argv
    |> parse_args
    |> process

    System.halt(0)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean])

    case parse do
      {[help: true], _, _} ->
        {:help}

      {[shift: shift], ["encrypt", message], _} ->
        {:encrypt, message, shift |> String.to_integer()}

      _ ->
        {:help}
    end
  end

  def process({:encrypt, message, shift}) do
    alias Caesar.Cipher

    Cipher.encrypt(message, shift)
    |> IO.puts()
  end

  def process({:help}) do
    IO.puts("""
    usage: ./caesar <command> <message> --shift <shift_number>
    """)
  end
end
