BrowserPolicy.framing.disallow()
BrowserPolicy.content.disallowInlineScripts()
BrowserPolicy.content.disallowEval()
BrowserPolicy.content.allowInlineStyles()
BrowserPolicy.content.allowFontDataUrl()

trusted = [
  "*.google-analytics.com"
  "fonts.googleapis.com"
  "fonts.gstatic.com"
]

for origin in trusted
  BrowserPolicy.content.allowOriginForAll origin
  origin = "https://#{origin}"
