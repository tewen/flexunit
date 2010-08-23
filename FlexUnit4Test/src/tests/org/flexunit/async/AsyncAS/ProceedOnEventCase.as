package tests.org.flexunit.async.AsyncAS
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncHandler;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	import org.hamcrest.assertThat;
	
	import tests.org.flexunit.async.AsyncAS.helper.AsyncHelper;
	
	public class ProceedOnEventCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Test]
		public function shouldProceedWithValidArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "ProceedEvent";
			var timeout:Number = 500;
			var handler:Function = new Function();
			var timeoutHandler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.proceedOnEvent( testCase, targetMock, eventName, timeout, timeoutHandler );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.pendUntilComplete, 
				timeout, null, timeoutHandler );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test]
		public function shouldProceedWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "ProceedEvent";
			
			var handler:Function = new Function();

			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.proceedOnEvent( testCase, targetMock, eventName );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.pendUntilComplete, 
				500, null, null );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "ProceedEvent";
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTestCaseUndefined():void {
			var testCase:Object = null;
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "ProceedEvent";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTargetUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = null;
			var eventName:String = "ProceedEvent";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfEventNameUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = null;
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
	}
}