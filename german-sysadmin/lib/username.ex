defmodule Username do
  # ä becomes ae
  # ö becomes oe
  # ü becomes ue
  # ß becomes ss
  def sanitize(username) do
    case username do
      [?ä | t] ->
        ~c"ae" ++ sanitize(t)
      [?ö | t] ->
        ~c"oe" ++ sanitize(t)
      [?ü | t] ->
        ~c"ue" ++ sanitize(t)
      [?ß | t] ->
        ~c"ss" ++ sanitize(t)
      [h | t] when h in(?a..?z) or h == ?_ ->
        [h | sanitize(t)]
      [_ | t] ->
        sanitize(t)
      [] ->
        []
    end
  end
end
