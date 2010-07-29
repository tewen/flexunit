package tests.flex.lang.reflect.metadata.utils.metaDataTools
{
	import flex.lang.reflect.utils.MetadataTools;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	
	public class ToolsWithValidData
	{
		[Test]
		public function shouldReturnTrueIfBaseIsClass():void {
			var descXML:XML = <classxml name="MyClass" base="Class" returnType="void"/>;
			
			assertTrue( MetadataTools.isClass( descXML ) );
		}
		
		[Test]
		public function shouldReturnFalseIfBaseNotClass():void {
			var descXML:XML = <classxml name="MyClass" base="DescriptionMock" returnType="void"/>;
			
			assertFalse( MetadataTools.isClass( descXML ) );
		}
		
		[Test]
		public function shouldReturnTrueIfBaseIsInstance():void {
			var descXML:XML = <classxml name="MyClass" base="DescriptionMock" returnType="void"/>;
			
			assertTrue( MetadataTools.isInstance( descXML ) );
		}
		
		[Test]
		public function shouldReturnFalseIfBaseIsClass():void {
			var descXML:XML = <classxml name="MyClass" base="Class" returnType="void"/>;
			
			assertFalse( MetadataTools.isInstance( descXML ) );
		}
		
		[Test]
		public function shouldReturnTrueIfExtendsClassTypeIsPassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfOneExtendsClassTypeIsPassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass type="DescriptionMock" />
									<extendsClass type="DescriptionMock2" />
								</classxml>;
			
			assertTrue( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock2" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfExtendsClassTwoTypesArePassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass type="DescriptionMock" />
									<extendsClass type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfExtendsClassTypeNoMatch():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass type="DescriptionMock2" />
								</classxml>;
			
			assertFalse( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfExtendsClassTwoTypesNoMatch():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<extendsClass type="DescriptionMock2" />
									<extendsClass type="DescriptionMock3" />
								</classxml>;
			
			assertFalse( MetadataTools.classExtendsFromNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfClassExtendsFromClass():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" returnType="void">
									<factory>
										<extendsClass type="DescriptionMock" />
									</factory>
								</classxml>;
			
			assertTrue( MetadataTools.classExtends( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfClassExtendsNotFromClass():void {
			var descXML:XML = 	<classxml name="MyClass" returnType="void">
									<extendsClass type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classExtends( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfImplementsInterfaceTypePassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfOneImplementsInterfaceTypePassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface type="DescriptionMock" />
									<implementsInterface type="DescriptionMock2" />
								</classxml>;
			
			assertTrue( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock2" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfTwoImplementsInterfaceTypesPassedIn():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface type="DescriptionMock" />
									<implementsInterface type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfImplementsInterfaceTypeNoMatch():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface type="DescriptionMock" />
								</classxml>;
			
			assertFalse( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock2" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfTwoImplementsInterfaceTypesNoMatch():void {
			var nodeXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<implementsInterface type="DescriptionMock" />
									<implementsInterface type="DescriptionMock2" />
								</classxml>;
			
			assertFalse( MetadataTools.classImpementsNode( nodeXML, "DescriptionMock3" ) );
		}
		
		[Test]
		public function shouldReturnIfClassImplementsFromClass():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" returnType="void">
									<factory>
										<implementsInterface type="DescriptionMock" />
									</factory>
								</classxml>;
			
			assertTrue( MetadataTools.classImplements( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnIfClassImplementsNotFromClass():void {
			var descXML:XML = 	<classxml name="MyClass" returnType="void">
									<implementsInterface type="DescriptionMock" />
								</classxml>;
			
			assertTrue( MetadataTools.classImplements( descXML, "DescriptionMock" ) );
		}
		
		[Test]
		public function shouldReturnValueIfArgumentsValid():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName">
										<arg key="description" value="DescriptionMock"/>
									</metadata>
								</method>;
			
			assertEquals( "DescriptionMock", MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnNullIfArgKeyNoMatch():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName">
										<arg key="description" value="DescriptionMock"/>
									</metadata>
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "falseDescription" ) );
		}
		
		[Test]
		public function shouldReturnNullIfMetaDataNameNoMatch():void {
			var nodeXML:XML = 	<method name="MytMethod">
									<metadata name="MyName">
										<arg key="description" value="DescriptionMock"/>
									</metadata>
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "falseMyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnIfGetArgFromClass():void {
			var descXML:XML = 	<classxml name="MyClass" base="Class" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<factory>
										<metadata name="MyName">
											<arg key="description" value="DescriptionMock"/>
										</metadata>
									</factory>
								</classxml>;
			
			assertEquals( "DescriptionMock", MetadataTools.getArgValueFromDescription( descXML, "MyName", "description" ) );
		}
		
		[Test]
		public function shouldReturnIfGetArgFromInstance():void {
			var descXML:XML = 	<classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<metadata name="MyName">
										<arg key="description" value="DescriptionMock"/>
									</metadata>
								</classxml>;
			
			assertEquals( "DescriptionMock", MetadataTools.getArgValueFromDescription( descXML, "MyName", "description" ) );
		}
		
		

	}
}