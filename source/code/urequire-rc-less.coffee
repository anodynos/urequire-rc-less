less = require 'less'

module.exports = [
  "@less"         # @ denotes FileResource, cause we dont want the .less text to be read when refreshing.

  ['**/*.less']

  (f, cb)->
    less.render """@import "#{f.srcFilepath}";""", @options, (err, result)->
      result = result.css if result?.css # less v2.0 support
      cb err, result    # asynchronous callback
  '.css'
]