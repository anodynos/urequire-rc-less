less = require 'less'

module.exports = [
  "@less"         # @ denotes FileResource, cause we dont want the .less text to be read when refreshing.

  ['**/*.less']

  (f, cb)->
    less.render """@import "#{f.srcFilepath}";""", @options, cb # asynchronous callback

  '.css'
]