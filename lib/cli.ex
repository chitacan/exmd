defmodule Exmd.CLI do
  def main(args) do
    {_parsed, args, _invalid} = OptionParser.parse(args, switches: [])

    with count when count == 1 <- Enum.count(args),
         [slug] <- args,
         true <- Regex.match?(~r/\w\/\w/, slug) do
      fetch(slug)
    else
      count when count != 1 -> :error
    end
  end

  defp help do
  end

  defp fetch(slug) do
    case HTTPotion.get("https://raw.githubusercontent.com/#{slug}/master/README.md") do
      %HTTPotion.Response{status_code: 200, body: body} -> print(body, slug)
      _ -> nil
    end
  end

  defp print(md, slug) do
    opts = [width: 80]
    IO.ANSI.Docs.print_heading("mafintosh/mafinto.sh", opts)
    IO.ANSI.Docs.print(md, opts)
  end
end
