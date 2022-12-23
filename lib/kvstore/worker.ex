defmodule Kvstore.Worker do
  @moduledoc """
  Store worker

  """

  use GenServer

  @doc """
  Start and link worker.
  """
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  @doc """
  Callback function for GenServer.init/1
  """
  @impl GenServer
  def init(state), do: {:ok, state}

  @doc """
  Callback function for GenServer.handle_call/3

  get and fetch values into state
  """
  @impl GenServer
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call(:fetch, _from, state) do
    {:reply, state, state}
  end

  @doc """
  Callback function for GenServer.handle_cast/2

  put and clear values into state
  """
  @impl GenServer
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_cast(:clear, _state) do
    {:noreply, %{}}
  end
end
