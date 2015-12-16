## open-path package  

open url or path use one shortcut  

## Projects that inspired me!

* [link](https://github.com/atom/link) from *atom*.
* [open-this](https://github.com/t9md/atom-open-this) from *t9md*.

## Keymap

**default**

```coffeescript
'.platform-darwin atom-text-editor:not([mini])':
	'cmd-o': 'open-path:toggle'

'.platform-win32 atom-text-editor:not([mini])':
	'ctrl-o': 'open-path:toggle'

'.platform-linux atom-text-editor:not([mini])':
	'ctrl-o': 'open-path:toggle'
```
