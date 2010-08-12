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
	
	import tests.org.flexunit.async.AsyncAS.helper.AsyncHelper;

	public class RegisterFailureEventCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Mock]
		public var asyncObj:AsyncHelper;
		
		[Test]
		public function shouldRegisterWithValidArguments():void {
			var testCase:Object = new Object();
			var eventName:String = "Register Failure Event";
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncErrorConditionHandler" ).returns( handler );
			stub( targetMock ).method( "addEventListener" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.registerFailureEvent( testCase, targetMock, eventName );
			
			verify( asyncHandlerMock ).method( "asyncErrorConditionHandler" ).args( asyncHandlerMock.failOnComplete );
			verify( targetMock ).method( "addEventListener" ).args( eventName, handler ); 
		}
		
		[Test]
		public function shouldCallHandlerOnEvent():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Register Failure Event";
			
			stub( asyncHandlerMock ).method( "asyncErrorConditionHandler" ).returns( asyncObj.assert );
			stub( asyncObj ).method( "assert" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.registerFailureEvent( testCase, target, eventName );
			
			target.dispatchEvent( new Event( eventName ) );
			
			verify( asyncObj ).method( "assert" );
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Proceed Event";
			
			Async.registerFailureEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTestCaseUndefined():void {
			var testCase:Object = null;
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = "Proceed Event";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.registerFailureEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfTargetUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = null;
			var eventName:String = "Proceed Event";
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.registerFailureEvent( testCase, target, eventName );
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowIfEventNameUndefined():void {
			var testCase:Object = new Object();
			var target:EventDispatcher = new EventDispatcher();
			var eventName:String = null;
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.registerFailureEvent( testCase, target, eventName );
		}
	}
}