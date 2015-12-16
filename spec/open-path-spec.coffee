OpenPath = require '../lib/open-path'

describe "OpenPath", ->
	[workspaceElement, activationPromise] = []

	beforeEach ->
		workspaceElement = atom.views.getView(atom.workspace)
		activationPromise = atom.packages.activatePackage('open-path')

	describe "when the open-path:toggle event is triggered", ->
		it "hides and shows the modal panel", ->

			atom.commands.dispatch workspaceElement, 'open-path:toggle'

			waitsForPromise ->
				activationPromise

			runs ->
				atom.commands.dispatch workspaceElement, 'open-path:toggle'
