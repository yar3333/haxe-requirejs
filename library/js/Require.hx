package js;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

typedef ConfigOptions =
{
	/**
	 * The root path to use for all module lookups.
	 */
	@:optional var baseUrl : String;
	
	/**
	 * Path mappings for module names not found directly under baseUrl.
	 * The path settings are assumed to be relative to baseUrl,
	 * unless the paths setting starts with a "/" or has a URL protocol in it ("like http:").
	 */
	@:optional var paths : Dynamic<String>;
	
	/**
	 * Introduced in RequireJS 2.1.10: allows configuring
	 * multiple module IDs to be found in another script.
	 */
	@:optional var bundles : Dynamic<Array<String>>;
	
	/**
	 * Configure the dependencies, exports, and custom initialization for older,
	 * traditional "browser globals" scripts that do not use define()
	 * to declare the dependencies and set a module value.
	 */
	@:optional var shim : Dynamic;
	
	/**
	 * For the given module prefix, instead of loading the module 
	 * with the given ID, substitute a different module ID.
	 * This sort of capability is really important 
	 * for larger projects which may have two sets of modules 
	 * that need to use two different versions of 'foo',
	 * but they still need to cooperate with each other.
	 */
	@:optional var map : Dynamic<Dynamic<String>>;
	
	/**
	 * There is a common need to pass configuration info to a module.
	 * That configuration info is usually known as part of the application,
	 * and there needs to be a way to pass that down to a module.
	 * In RequireJS, that is done with the config option for requirejs.config().
	 * Modules can then read that info by asking for the special 
	 * dependency "module" and calling module.config().
	 */
	@:optional var config : Dynamic;
	
	/**
	 * Configures loading modules from CommonJS packages.
	 * See http://requirejs.org/docs/api.html#packages.
	 */
	@:optional var packages : Array<EitherType<String, { name:String, ?location:String, ?main:String }>>;
	
	/**
	 *  Node treats module ID example.js and example the same.
	 * By default these are two different IDs in RequireJS.
	 * If you end up using modules installed from npm,
	 * then you may need to set this config value to true to avoid resolution issues.
	 * This option only applies to treating the ".js" suffix differently,
	 * it does not do any other node resolution
	 * and evaluation matching such as .json file handling
	 * (JSON handling needs a 'json!' loader plugin anyway).
	 * Available in 2.1.10 and greater.
	 */
	@:optional var nodeIdCompat : Dynamic;
	
	/**
	 * The number of seconds to wait before giving up on loading a script.
	 * Setting it to 0 disables the timeout. The default is 7 seconds.
	 */
	@:optional var waitSeconds : Float;
	
	/**
	 * A name to give to a loading context.
	 * This allows require.js to load multiple versions of modules in a page, 
	 * as long as each top-level require call specifies a unique context string.
	 * To use it correctly, see the Multiversion Support section.
	 */
	@:optional var context : Dynamic;
	
	/**
	 * An array of dependencies to load. Useful when require
	 * is defined as a config object before require.js is loaded,
	 * and you want to specify dependencies to load as soon as require() is defined.
	 */
	@:optional var deps : Dynamic;
	
	/**
	 * A function to execute after deps have been loaded.
	 * Useful when require is defined as a config object before require.js
	 * is loaded, and you want to specify a function to require 
	 * after the configuration's deps array has been loaded.
	 */
	@:optional var callback : Function;
	
	/**
	 * If set to true, an error will be thrown if a script loads that does not call define() 
	 * or have a shim exports string value that can be checked.
	 * See Catching load failures in IE for more information.
	 */
	@:optional var enforceDefine : Bool;
	
	/**
	 * If set to true, document.createElementNS() will be used to create script elements.
	 */
	@:optional var xhtml : Bool;
	
	/**
	 * Extra query string arguments appended to URLs that RequireJS uses 
	 * to fetch resources. Most useful to cache bust when the browser 
	 * or server is not configured correctly.
	 */
	@:optional var urlArgs : String;
	
	/**
	 * Specify the value for the type="" attribute 
	 * used for script tags inserted into the document by RequireJS.
	 * Default is "text/javascript".
	 * To use Firefox's JavaScript 1.8 features, use "text/javascript;version=1.8".
	 */
	@:optional var scriptType : String;
	
	/**
	 * Introduced in RequireJS 2.1.9: If set to true, skips the data-main 
	 * attribute scanning done to start module loading.
	 * Useful if RequireJS is embedded in a utility library
	 * that may interact with other RequireJS library on the page,
	 * and the embedded version should not do data-main loading.
	 */
	@:optional var skipDataMain : Bool;
}

@:native("require")
extern class Require
{
	private static function __init__() : Void
	{
		haxe.macro.Compiler.includeFile("js/Require.js");
	}
	
	static function config(options:ConfigOptions) : Void;
	
	@:selfCall
	static function load(modules:Array<String>, callb:Function) : Void;
}