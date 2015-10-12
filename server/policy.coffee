BrowserPolicy.framing.disallow()
#BrowserPolicy.content.disallowInlineScripts()
BrowserPolicy.content.disallowEval()
BrowserPolicy.content.allowInlineStyles()
BrowserPolicy.content.allowFontDataUrl()

trusted = [
  "*.google-analytics.com"
  "fonts.googleapis.com"
  "fonts.gstatic.com"
  "*.eveonline.com"
]

for origin in trusted
  origin = "https://#{origin}"
  BrowserPolicy.content.allowOriginForAll origin
