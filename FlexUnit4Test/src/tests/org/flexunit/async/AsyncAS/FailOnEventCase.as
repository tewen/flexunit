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
			var eventName:String = "Fail Event";
			var timeout:Number = 500;
			var handler:Function = new Function();
			var timeoutHandler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, targetMock, eventName, timeout, timeoutHandler );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.failOnComplete, 
				timeout, null, timeoutHandler );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test]
		public function shouldFailWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "Fail Event";

			var handler:Function = new Function();

			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, targetMock, eventName );
			
			verify( asyncHandlerMock ).method( "asyncHandler" ).args( asyncHandlerMock.failOnComplete, 500, null, null );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler, 
				false, 0, true ); 
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Fail Event";
			
			Async.proceedOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTestCaseUndefined():void {
			var testCase:Object = null;
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Fail Event";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.failOnEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTargetUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = null;
			var eventName:String = "Fail Event";
			
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