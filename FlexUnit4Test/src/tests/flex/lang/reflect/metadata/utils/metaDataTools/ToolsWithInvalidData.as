package tests.flex.lang.reflect.metadata.utils.metaDataTools
{
	import flex.lang.reflect.utils.MetadataTools;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	
	public class ToolsWithInvalidData
	{
		[Test]
		public function shouldReturnFalseIfBaseUndefined():void {
			var descXML:XML = <classxml name="MyClass" returnType="void"/>;
			
			assertFalse( MetadataTools.isClass( descXML ) );
		}
		
		[Test]
		public function shouldReturnTrueIfBaseUndefined():void {
			var descXML:XML = <classxml name="MyClass" returnType="void"/>;
			
			assertTrue( MetadataTools.isInstance( descXML ) );
		}
		
		[Test(expects="ReferenceError")]
		public function shouldThrowIfExtendsClassTypeUndefined():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass />
								</classxml>;
			
			MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" );
		}
		
		[Test]
		public function shouldReturnFalseIfNotExtendsClass():void {
			var nodeXML:XML = <classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void" />;
			
			assertFalse( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfNodeUndefined():void {
			var nodeXML:XML = null;
			
			assertFalse( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );	
		}
		
		[Test]
		public function shouldReturnFalseIfClassExtendsClassWithoutFactory():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" returnType="void">
									<extendsClass type="DescriptionMock" />
								</classxml>;
			
			assertFalse( MetadataTools.classExtends( descXML, "DescriptionMock" ) );
		}
		
		
		[Test]
		public function shouldReturnFalseIfClassExtendsInstanceWithFactory():void {
			var descXML:XML = 	<classxml name="MyClass" returnType="void">
									<factory>
										<extendsClass type="DescriptionMock" />
									</factory>
								</classxml>;
			
			assertFalse( MetadataTools.classExtends( descXML, "DescriptionMock" ) );
		}
		
		[Test(expects="ReferenceError")]
		public function shouldThrowIfImplementsInterfaceTypeUndefined():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface />
								</classxml>;
			
			MetadataTools.classImpementsNode( nodeXML, "DescriptionMock" );
		}
		
		[Test]
		public function shouldReturnFalseIfImplementsInterfaceUndefined():void {
			var nodeXML:XML = <classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void" />;
			
			assertFalse( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfNodeIsUndefined():void {
			var nodeXML:XML = null;
			
			assertFalse( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfClassImplementsClassWithoutFactory():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" returnType="void">
										<implementsInterface type="DescriptionMock" />
								</classxml>;
			
			assertFalse( MetadataTools.classImplements( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfClassImplementsInstanceWithFactory():void {
			var descXML:XML = 	<classxml name="MyClass" returnType="void">
									<factory>
										<implementsInterface type="DescriptionMock" />
									</factory>
								</classxml>;
			
			assertFalse( MetadataTools.classImplements( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnNullIfArgValueUndefined():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName">
										<arg key="description" />
									</metadata>
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "description" ) );
		}
		
		[Test(expects="ReferenceError")]
		public function shouldReturnNullIfArgKeyUndefined():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName">
										<arg value="DescriptionMock" />
									</metadata>
								</method>;
			
			MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "description" );
		}
		
		[Test]
		public function shouldReturnNullIfArgUndefined():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName" />
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnNullIfMetaDataUndefined():void {
			var nodeXML:XML = 	<method name="MytMethod" />;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnNullIfGetArgClassWthoutFactory():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<metadata name="MyName">
										<arg key="description" value="DescriptionMock"/>
									</metadata>
								</classxml>;
			
			assertNull( MetadataTools.getArgValueFromDescription( descXML, "MyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnNullIfGetArgInstanceWithFactory():void {
			var descXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<factory>
										<metadata name="MyName">
											<arg key="description" value="DescriptionMock"/>
										</metadata>
									</factory>
								</classxml>;
			
			assertNull( MetadataTools.getArgValueFromDescription( descXML, "MyName", "description" ) );
		}
	}
}