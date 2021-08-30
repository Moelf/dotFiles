using Debugger
using OhMyREPL
colorscheme!("GruvboxDark")
import Base64:base64decode
mega(s::String) = (String ∘ base64decode)(s)
mega() = mega(clipboard())
