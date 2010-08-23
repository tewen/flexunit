package tests.org.flexunit.async.AsyncAS
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	import org.hamcrest.assertThat;
	
	import tests.org.flexunit.async.AsyncAS.helper.AsyncHelper;

	public class HandleEventCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Mock]
		public var asyncCaller:AsyncHelper;
		
		[Mock]
		public var asyncObj:AsyncHelper;
		
		[Test]
		public function shouldAssignWithValidArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "Handle Event";
			var eventHandler:Function = new Function();
			var timeout:Number = 500;
			var passThroughData:Object = new Object();
			var timeoutHandler:Function = new Function();
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, targetMock, eventName, eventHandler, timeout, passThroughData, timeoutHandler );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, passThroughData, timeoutHandler );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true );
		}
		
		[Test]
		public function shouldAssignWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "Handle Event";
			var eventHandler:Function = new Function();
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, targetMock, eventName, eventHandler );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				500, null, null );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true );
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Handle Event";
			var eventHandler:Function = new Function();
			
			Async.handleEvent( testCase, target, eventName, eventHandler );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTestCaseUndefined():void {
			var testCase:Object = null;
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Handle Event";
			var eventHandler:Function = new Function();
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, target, eventName, eventHandler );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTargetUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = null;
			var eventName:String = "Handle Event";
			var eventHandler:Function = new Function();
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, target, eventName, eventHandler );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfEventNameUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = null;
			var eventHandler:Function = new Function();
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, target, eventName, eventHandler );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfEventHandlerUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Handle Event";
			var eventHandler:Function = null;
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.handleEvent( testCase, target, eventName, eventHandler );
		}
	}
}