OpenPath = require '../lib/open-path'

describe "OpenPath", ->
	[workspaceElement, activationPromise] = []

	beforeEach ->
		workspaceElement = atom.views.getView(atom.workspace)
		activationPromise = atom.packages.activatePackage('open-path')

	describe "when the open-path:open event is triggered", ->
		it "hides and shows the modal panel", ->

			atom.commands.dispatch workspaceElement, 'open-path:open'

			waitsForPromise ->
				activationPromise

			runs ->
				atom.commands.dispatch workspaceElement, 'open-path:open'

	describe "when the open-path:copy-image-size event is triggered", ->
		it "hides and shows the modal panel", ->

			atom.commands.dispatch workspaceElement, 'open-path:copy-image-size'

			waitsForPromise ->
				activationPromise

			runs ->
				atom.commands.dispatch workspaceElement, 'open-path:copy-image-size'
