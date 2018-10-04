let g:projectionist_heuristics = {
			\  "mix.exs": {
			\    "lib/*.ex": {
			\      "command": "lib",
			\      "template": [ "defmodule {capitalize|camelcase|dot} do", "", "end" ],
			\      "alternate": "test/{}_test.exs"
			\    },
			\    "test/*_test.exs": {
			\      "command": "test",
			\      "template": [ "defmodule {capitalize|camelcase|dot}Test do", "  use ExUnit.Case", "end" ],
			\      "alternate": "lib/{}.ex"
			\    },
			\    "config/config.exs": {
			\      "command": "config"
			\    },
			\    "config/*.exs": {
			\      "command": "config"
			\    },
			\    "mix.exs": {
			\      "command": "mix"
			\    },
			\    "README.md": {
			\      "command": "readme"
			\    }
			\  }
			\}
