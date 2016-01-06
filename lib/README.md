## 功能添加  
需不需要 为路劲 加上下划线 中键点击打开  
这样更简单明了  
建立一个 span.open-path  
为这个建立监听事件  

```coffeescript  

	atom.workspace.observeTextEditors (editor) ->  
		editor_content = atom.views.getView(editor).shadowRoot  
		links = editor_content.querySelectorAll('.link')  
		console.log links  
		# links = [] can't find editor on load event  

```  

