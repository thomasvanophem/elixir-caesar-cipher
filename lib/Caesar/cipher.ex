defmodule Caesar.Cipher do
  require Logger
  @alphabet_size Application.get_env(:caesar, :alphabet_size)

  @moduledoc """
  Caesar Cipher module, which maps characters to new characters
  """

  @doc """
  Encrypt the message by applying a mapping that shifts the alphabet by the `shift` value

  ## Examples

      iex> Caesar.Cipher.encrypt("hello world!", 1)
      "gdkkn vnqkc!"
  """
  def encrypt(message, shift) do
    # convert message to char_list
    # iterate over list apply shift mapping
    # return list as a binary string
    Logger.debug("encrypting \"#{message}\" with  a shift number: #{shift}")
    message 
      |> to_charlist
      |> Enum.map(&shift_char(&1, shift))
      |> List.to_string
  end

  def shift_char(char, shift) do
    case char do
      char when char in (?a..?z) -> calculate_mapping(?a, char, shift)
      char when char in (?A..?z) -> calculate_mapping(?A, char, shift)
      char -> char
    end
  end

  def calculate_mapping(base_letter, char, shift) do
    # find the ASCII integer of the character and normalize it
    # by subtracting the size of the alphabet
    normalize = &(&1 - @alphabet_size)
    # ensure the shift number is within the alphabet size
    shift_number = rem(shift, @alphabet_size)
    # calculate the shifted value
    base_letter + rem(char - normalize.(base_letter) - shift_number, @alphabet_size)
  end
end