require "middleman-core"

::Middleman::Extensions.register :tiny_png do
  require_relative "middleman-tiny_png/extension"
  ::Middleman::TinyPNG::Extension
end
