using Debugger
using OhMyREPL
colorscheme!("GruvboxDark")
import Base64:base64decode
mega(s::String) = (String ∘ base64decode)(s)
function mega()
    origin = clipboard()
    url = mega(origin)
    clipboard(url)
    run(`xdg-open $url`)
end
using Revise
