defmodule Kvstore do
  @moduledoc """
  Simple key/value store based on GenServer.

  ## Examples

      iex> Kvstore.put("a", 1)
      iex> Kvstore.get("a")
      1

      iex> Kvstore.clear
      iex> Kvstore.fetch
      %{}

      iex> Kvstore.clear
      iex> Kvstore.put("q", 9)
      iex> Kvstore.put("x", 10)
      iex> Kvstore.fetch
      %{"q" => 9, "x" => 10}

  """

  alias Kvstore.Worker

  @doc """
  put value to store
  """
  def put(key, value) do
    GenServer.cast(Worker, {:put, key, value})
  end

  @doc """
  get value by key from store
  """
  def get(key) do
    GenServer.call(Worker, {:get, key})
  end

  @doc """
  get all values from store
  """
  def fetch do
    GenServer.call(Worker, :fetch)
  end

  @doc """
  clear all values in state
  """
  def clear do
    GenServer.cast(Worker, :clear)
  end
end
