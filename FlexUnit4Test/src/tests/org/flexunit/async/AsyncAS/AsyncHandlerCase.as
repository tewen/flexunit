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
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class AsyncHandlerCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Test]
		public function shouldReturnWithAllValidArguments():void {
			var testCase:Object = new Object();
			var eventHandler:Function = new Function();
			var timeout:Number = 500;
			var passThroughData:Object = new Object();
			var timeoutHandler:Function = new Function();
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, passThroughData, timeoutHandler ).returns( handler );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncHandler( testCase, eventHandler, timeout, passThroughData, timeoutHandler ), equalTo( handler ) );
		}
		
		[Test]
		public function shouldReturnWithSomeDefaultArguments():void {
			var testCase:Object = new Object();
			var eventHandler:Function = new Function();
			var timeout:Number = 500;
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, null, null ).returns( handler );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			assertThat( Async.asyncHandler( testCase, eventHandler, timeout ), equalTo( handler ) );
		}
		
		[Test]
		public function shouldReturnIfTestCaseUndefined():void {
			var testCase:Object = null;
			var eventHandler:Function = new Function();
			var timeout:Number = 500;
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, null, null ).returns( handler );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.asyncHandler( testCase, eventHandler, timeout );
			
			assertThat( Async.asyncHandler( testCase, eventHandler, timeout ), equalTo( handler ) );
		}
		
		[Test]
		public function shouldReturnIfEventHandlerUndefined():void {
			var testCase:Object = new Object();
			var eventHandler:Function = null;
			var timeout:Number = 500;
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, null, null ).returns( handler );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.asyncHandler( testCase, eventHandler, timeout );
			
			assertThat( Async.asyncHandler( testCase, eventHandler, timeout ), equalTo( handler ) );
		}
		
		[Test]
		public function shouldReturnNullIfTimeoutUndefined():void {
			var testCase:Object = new Object();
			var eventHandler:Function = new Function();
			var timeout:Number;
			
			var handler:Function = new Function();
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).args( eventHandler, 
				timeout, null, null ).returns( handler );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			
			Async.asyncHandler( testCase, eventHandler, timeout );
			
			assertThat( Async.asyncHandler( testCase, eventHandler, timeout ), equalTo( null ) );
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