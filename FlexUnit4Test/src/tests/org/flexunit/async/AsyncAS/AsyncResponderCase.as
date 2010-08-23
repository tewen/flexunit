package tests.org.flexunit.async.AsyncAS
{
	import flash.events.IEventDispatcher;
	
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class AsyncResponderCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var responderMock:IResponder;
		
		[Test]
		public function shouldReturnWithValidArguments():void {
			var testCase:Object = new Object();
			var responder:Object = new Object();
			var timeout:Number = 500;
			var passThroughData:Object = new Object();
			var timeoutHandler:Function = new Function();
						
			stub( asyncHandlerMock ).method( "asyncResponder" ).args( responder, 
				timeout, passThroughData, timeoutHandler ).returns( responderMock );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncResponder( testCase, responder, timeout, passThroughData, timeoutHandler ), equalTo( responderMock ) );
		}
		
		[Test]
		public function shouldReturnWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var responder:Object = new Object();
			var timeout:Number = 500;
			
			stub( asyncHandlerMock ).method( "asyncResponder" ).args( responder, 
				timeout, null, null ).returns( responderMock );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncResponder( testCase, responder, timeout ), equalTo( responderMock ) );
		}
		
		[Test]
		public function shouldReturnIfTestCaseUndefined():void {
			var testCase:Object = null;
			var responder:Object = new Object();
			var timeout:Number = 500;
						
			stub( asyncHandlerMock ).method( "asyncResponder" ).args( responder, 
				timeout, null, null ).returns( responderMock );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncResponder( testCase, responder, timeout ), equalTo( responderMock ) );
		}
		
		[Test]
		public function shouldReturnIfResponderUndefined():void {
			var testCase:Object = new Object();
			var responder:Object = null;
			var timeout:Number = 500;
						
			stub( asyncHandlerMock ).method( "asyncResponder" ).args( responder, 
				timeout, null, null ).returns( responderMock );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncResponder( testCase, responder, timeout ), equalTo( responderMock ) );
		}
		
		[Test]
		public function shouldReturnNullIfTimeoutUndefined():void {
			var testCase:Object = new Object();
			var responder:Object = new Object();
			var timeout:Number;
			
			stub( asyncHandlerMock ).method( "asyncResponder" ).args( responder, 
				timeout, null, null ).returns( responderMock );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncResponder( testCase, responder, timeout ), equalTo( null ) );
		}
		
		[Test(expects="org.flexunit.AssertionError")]
		public function shouldThrowIfTestCaseUnregistered():void {
			var testCase:Object = new Object();
			var eventHandler:Function = new Function();
			var timeout:Number = 500;
			
			Async.asyncHandler( testCase, eventHandler, timeout );
		}
	}
}