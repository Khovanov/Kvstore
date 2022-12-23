defmodule Kvstore.WorkerTest do
  use ExUnit.Case, async: true

  alias Kvstore.Worker

  describe "cast/2 :put" do
    test "returns :ok" do
      assert GenServer.cast(Worker, {:put, "a", 1}) == :ok
    end
  end

  describe "call/2 :get" do
    setup do
      GenServer.cast(Worker, {:put, "a", 2})

      :ok
    end

    test "returns valid value" do
      assert GenServer.call(Worker, {:get, "a"}) == 2
    end
  end

  describe "call/2 :fetch" do
    setup do
      GenServer.cast(Worker, :clear)
      GenServer.cast(Worker, {:put, "c", 11})
      GenServer.cast(Worker, {:put, "d", 22})

      :ok
    end

    test "returns valid map" do
      assert GenServer.call(Worker, :fetch) == %{"c" => 11, "d" => 22}
    end
  end

  describe "cast/2 :clear" do
    setup do
      GenServer.cast(Worker, {:put, "e", 33})

      :ok
    end

    test "returns :ok and empty state" do
      assert GenServer.cast(Worker, :clear) == :ok
      assert GenServer.call(Worker, :fetch) == %{}
    end
  end
end
