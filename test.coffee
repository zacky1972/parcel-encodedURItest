fs = require 'fs'
require 'should'

describe 'index.html', ->
	it 'equals index-success.html', ->
		data1= fs.readFileSync './index-success.html', 'utf-8'
		data2= fs.readFileSync './index.html', 'utf-8'
		data2.should.equal data1

