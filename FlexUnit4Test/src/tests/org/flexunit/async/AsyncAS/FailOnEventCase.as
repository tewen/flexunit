package tests.org.flexunit.async.AsyncAS
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;

	public class FailOnEventCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Test]
		public function shouldFailWithValidArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "failEvent";
			var timeout:Number = 500;
			var handler:Function = new Function();
			var timeoutHandler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.failOnComplete, 
				timeout, null, timeoutHandler ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, targetMock, eventName, timeout, timeoutHandler );
			
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test]
		public function shouldFailWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "failEvent";

			var handler:Function = new Function();

			stub( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.failOnComplete, 500, null, null ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, targetMock, eventName );
			
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "failEvent";
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTestCaseUndefined():void {
			var testCase:Object = null;
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "failEvent";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTargetUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = null;
			var eventName:String = "failEvent";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfEventNameUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = null;
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, target, eventName );
		}
	}
}