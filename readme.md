[uRequire](http://urequire.org) [ResourceConverter](http://urequire.org/resourceconverters.coffee)

Converts `*.less` to `*.css`, supporting `less.render` options {} & uRequire's `srcMain`. Supports both less v1.x & less v2.x

# How to use (in your [uRequire config](http://urequire.org/masterdefaultsconfig.coffee))

## Simple use

All `.less` files in your 'path' are converted to a corresponding `.css` in your 'dstPath'.

```javascript
    ...
    resources: [
        ...
        'less'
        ...
    ]
    ...
```


## Passing [**less options**](http://lesscss.org/#using-less-configuration):

### Simple options

```javascript
    ...
    resources: [
        ...
        ['less', {compress: true}]
        ...
    ]
    ...
```

## Having a `myMainStyle.less` file that imports all others.

No `.less` files are converted to a their corresponding `.css`, except `myMainStyle.less`.
It also works well when watching: when one or more `.less` files change, `myMainStyle.less` is **the only one compiled** (once per build).

It uses the `srcMain` property of ResourceConverter (RC) to denote that **only this file gets converted**.

These are some of the different ways to lookup (or load) the 'less' RC and pass {} options, as well as RC properties:

### All keys starting with `$`, belong to the RC instance, not the options {}.

```javascript
    ['less', {
        $srcMain: 'style/myMainStyle.less',
        compress: true
    }]
```

### All properties inside `$` key again belong to the RC.

```javascript
    ['less', {
       '$': {
         srcMain: 'style/myMainStyle.less', // path relative to `bundle.path`
         filez: ['**/*.less', '!**/badLess.less'],
         convFilename: "myMainStyleNewFilename.css"
       },
       compress: true
    }]
```

### Formally adding to the RC instance.

```javascript
    function(lookup){
      return _.extend(lookup('less'), {
        srcMain: 'style/myMainStyle.less',
        options: compress: true
      });
    }
```

or without using `_.extend` :

```
    function(lookup){
        rc = lookup('less');
        rc.srcMain = 'style/myMainStyle.less';
        return rc;
    }

```

## History

v1.0 Initial release, works with less v1.x
v1.1 Works with both less v1.x & v2.0

# License

The MIT License

Copyright (c) 2014 Agelos Pikoulas (agelos.pikoulas@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
