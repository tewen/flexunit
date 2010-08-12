package tests.org.flexunit.async.AsyncAS
{
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mockolate.runner.MockolateRule;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.async.AsyncLocator;
	import org.flexunit.internals.runners.statements.IAsyncHandlingStatement;
	
	import tests.org.flexunit.async.AsyncAS.helper.AsyncHelper;

	public class AsyncProceedOnEventCase
	{
		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();
		
		[Mock]
		public var asyncHandlerMock:IAsyncHandlingStatement;
		
		[Mock]
		public var targetMock:IEventDispatcher;
		
		[Mock]
		public var asyncObj:AsyncHelper;
		
		private var timer:Timer;
		
		[Before]
		public function setUp():void {
			timer = new Timer( 100, 1);
		}
		
		[After]
		public function tearDown():void {
			if( timer )
				timer.stop()
					
			timer = null;
		}
		
		[Ignore]
		[Test (async)]
		public function shouldTimeoutWithoutFunction():void {
			var testCase:Object = new Object();
			var eventName:String = "Proceed Event";
			var timeout:Number = 500;
			
			timer.delay = 100;
			timer.addEventListener( TimerEvent.TIMER_COMPLETE, 
				Async.asyncHandler(this, handleTimeoutWithoutFunction, 2000, null, handleTimeout ), false, 0, true);
			
			stub( asyncHandlerMock ).method( "asyncHandler" ).returns( asyncObj.assert );
			stub( targetMock ).method( "addEventListener" ).calls( timer.start );
			stub( asyncObj ).method( "assert" );
			
			AsyncLocator.registerStatementForTest( asyncHandlerMock, testCase );
			Async.proceedOnEvent( testCase, targetMock, eventName, timeout );	
		}
		
		protected function handleTimeoutWithoutFunction(event:TimerEvent, passThroughData:Object):void {
			verify( asyncObj ).method( "assert" );
		}
		
		protected function handleTimeout( passThroughData:Object ):void {
			Assert.fail( "Async.asyncHandler timed out" );
		}
		
		//Not too sure how to mock this one, holding up for more information
		[Ignore]
		[Test]
		public function shouldCallTimeoutHandlerFunction():void {
		}
	}
}