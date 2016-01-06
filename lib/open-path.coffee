_shell = require 'shell'
_path = require 'path'
_fs = require 'fs-plus'
_ = require 'underscore-plus'
{CompositeDisposable} = require 'atom'

module.exports = OpenPath =

	urlRegex: /[A-Z a-z 0-9 \.\_\/\~\%\-\+\&\#\?\!\=\@\:]+/
	pathRegex: /[-\w\/\\\.\:]+/
	httpRegex: /(http|https)\:\/\/[^\s]+/
	editor: null

	activate: (state) ->
		@subscriptions = new CompositeDisposable

		@subscriptions.add atom.commands.add 'atom-text-editor', 'open-path:toggle':(event) => @toggle(event)

	deactivate: ->
		@subscriptions.dispose()

	toggle:(event) ->
		@editor = atom.workspace.getActiveTextEditor()
		if path = @geturl()
			return _shell.openExternal("#{path}")
		if path = @getpath()
			return atom.workspace.open(path, searchAllPanes: true)
		event.abortKeyBinding()

	geturl:() ->
		range = @editor.getLastCursor().getCurrentWordBufferRange({wordRegex: @urlRegex})
		string = @editor.getTextInBufferRange(range)
		if strmatch = string.match(@httpRegex)
			return strmatch[0]
		return false

	getpath:() ->
		range = @editor.getLastCursor().getCurrentWordBufferRange({wordRegex: @pathRegex})
		path = @editor.getTextInBufferRange(range)

		if not path
			return false

		if tmp1path = @detectfile(path)
			return tmp1path

		curdir = _path.dirname(@editor.getPath())
		path = _path.resolve(curdir, path)

		if tmp2path = @detectfile(path)
			return tmp2path

	detectfile:(path) ->

		if _path.extname(path)
			return path if @isfile(path)

		scopeName = @editor.getGrammar().scopeName
		grammar = atom.grammars.grammarForScopeName(scopeName)
		exts = grammar.fileTypes ? []
		files = _.uniq ("#{path}.#{ext}" for ext in exts)

		file = _.detect files, @isfile
		return file if file?

	isfile:(file) ->
		return _fs.existsSync(file) and _fs.lstatSync(_fs.realpathSync(file))?.isFile()
