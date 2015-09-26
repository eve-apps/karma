BrowserPolicy.framing.disallow()
BrowserPolicy.content.disallowInlineScripts()
BrowserPolicy.content.disallowEval()
BrowserPolicy.content.allowInlineStyles()
BrowserPolicy.content.allowFontDataUrl()

trusted = [
  "*.google-analytics.com"
]

for origin in trusted
  BrowserPolicy.content.allowOriginForAll origin
  origin = "https://#{origin}"
