#!/usr/bin/env node

/*
 * Dependencies
 */

var spawn = require('child_process').spawn


var cwd = process.cwd()
var path = cwd.split('/')
var dirname = path[path.length - 1]
var branch = ''
var branchType = ''
var colorCodes = { black: 30, red: 31, green: 32, yellow: 33, blue: 34, magenta: 35, cyan: 36, white: 37, grey: 90 }

var defaults = {
	colors: {
		master: 'cyan',
		develop: 'green',
		feature: 'blue',
		refactor: 'yellow',
		bug: 'red',
		other: 'magenta'
	}
}

spawn('git', ['rev-parse', '--abbrev-ref', 'HEAD']).stdout

.on('data', function (data) {
	var rend = render
	render = null
	branch = data.toString().trim()
	
	Object.keys(defaults.colors).forEach(function (color, index, arr) {
		var reg = new RegExp(color + '/')
		if (branch.match(reg)) {
			var split = branch.split('/')
			branchType = split.shift()
			branch = split.join('/')
		}
	})
	
	spawn('git', ['status']).stdout
	
	.on('data', function (data) {
		var status = data.toString()
		var dirty = status.split('\n')[1] !== 'nothing to commit, working directory clean'
		if (dirty) defaults.seperator = colorize(defaults.seperator)
	})
	
	.on('close', function (code) {
		rend()
	})
	
})

.on('error', function (err) {
	console.log('error with bash_prompt.js' + err)
})

.on('close', function (code) {
	if (render) render()
})


function render () {
	var prompt = ''
	prompt += dirname
	prompt += ' '
	if (branch) prompt += '(' + colorize(branch) + ')'
	console.log(prompt)
}


function colorize (text) {
	var color = branchType || branch
	var code = defaults.colors[color] || defaults.colors.other
	return '\x1B[' + colorCodes[code] + 'm' + text + '\x1B[39m'
}

