using Debugger
using OhMyREPL
import Base64:base64decode
mega(s::String) = (String ∘ base64decode)(s)
mega() = mega(clipboard())
