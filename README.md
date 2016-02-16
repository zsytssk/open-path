## open-path package  

* use 'open-path:open' to open url or file under cursor  
* use 'open-path:copy-image-size' to copy image size like'width: width; height: height;'  

## Keymap  

**default**  

```coffeescript  
'.platform-darwin atom-text-editor:not([mini])':  
	'cmd-o': 'open-path:open'  
	'alt-c': 'open-path:copy-image-size'  

'.platform-win32 atom-text-editor:not([mini])':  
	'ctrl-o': 'open-path:open'  
	'alt-c': 'open-path:copy-image-size'  

'.platform-linux atom-text-editor:not([mini])':  
	'ctrl-o': 'open-path:open'  
	'alt-c': 'open-path:copy-image-size'  
```  

## Projects that inspired me!  

* [link](https://github.com/atom/link) from *atom*.  
* [open-this](https://github.com/t9md/atom-open-this) from *t9md*.  

## Contributor  

[pwelyn](https://github.com/pwelyn)  
