package tests.flex.lang.reflect.builders.methodBuilder
{
	import flash.utils.describeType;
	
	import flex.lang.reflect.Method;
	import flex.lang.reflect.builders.MethodBuilder;
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.constants.AnnotationConstants;
	
	import tests.flex.lang.reflect.klass.helper.Ancestor1;
	import tests.flex.lang.reflect.klass.helper.Ancestor2;
	import tests.flex.lang.reflect.klass.helper.ClassForIntrospection;
	
	public class MethodBuilderWithInvalidData
	{
		private var describedData:XML;
		private var methodBuilder:MethodBuilder;
		private var counter:int = 0;
		
		//The 'setup' is included in each case because it differs per test case
		
		[Test(expects="TypeError")]
		public function shouldThrowWhenXMLArgumentUndefined():void {
			describedData = null;
			methodBuilder = new MethodBuilder( describedData, [Ancestor2, Ancestor1, Object] );
			
			var methods:Array = methodBuilder.buildAllMethods();
			
			counter++;
		}
		
		[Test]
		public function shouldReturnWhenInheritanceUndefined():void {
			describedData = describeType( ClassForIntrospection );
			methodBuilder = new MethodBuilder( describedData, null );
			
			var methods:Array = methodBuilder.buildAllMethods();
			
			assertNotNull( methods );
			
			methods.sortOn( "name" );
			assertEquals( "baseMethod",  ( methods[ 0 ] as Method ).name );
			assertEquals( "returnFalse", ( methods[ 1 ] as Method ).name );
			assertEquals( "returnTrue",  ( methods[ 2 ] as Method ).name );
			
			counter++;
		}
		
		[Test(expects="TypeError")]
		public function shouldThrowWhenXMLAndInheritanceUndefined():void {
			describedData = null;
			methodBuilder = new MethodBuilder( describedData, null );
			
			var methods:Array = methodBuilder.buildAllMethods();
			
			counter++;
		}
	}
}