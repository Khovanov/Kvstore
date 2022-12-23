defmodule KvstoreTest do
  use ExUnit.Case, async: true
  doctest Kvstore

  describe "put/2" do
    test "returns :ok" do
      assert Kvstore.put("a", 1) == :ok
    end
  end

  describe "get/1" do
    test "returns valid value" do
      Kvstore.put("b", 2)

      assert Kvstore.get("b") == 2
    end
  end

  describe "clear/0" do
    test "returns :ok and clear all values into store" do
      Kvstore.put("d", 4)

      assert Kvstore.clear() == :ok
      assert Kvstore.fetch() == %{}
    end
  end

  describe "fetch/0" do
    setup do: Kvstore.clear()
    :ok

    test "returns all stored values" do
      Kvstore.put("e", 5)
      Kvstore.put("f", 6)

      assert Kvstore.fetch() == %{"e" => 5, "f" => 6}
    end
  end
end
