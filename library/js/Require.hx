package js;

import haxe.Constraints.Function;

@:native("requirejs")
extern class Require
{
	static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/Require.js");
	}
	
	static function config(options:{ ?baseUrl:String, ?paths:Dynamic<String> }) : Void;
	
	@:selfCall
	static function load(modules:Array<String>, callb:Function) : Void;
}