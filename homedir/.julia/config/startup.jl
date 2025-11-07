using Debugger
using OhMyREPL
enable_autocomplete_brackets(false)
colorscheme!("GruvboxDark")
import Base64: base64decode
mega(s::String) = (String ∘ base64decode)(s)
function mega()
    origin = clipboard()
    url = mega(origin)
    clipboard(url)
    run(`xdg-open $url`)
end
using Revise
ENV["JULIA_EDITOR"] = "nvim"

using KittyTerminalImages
