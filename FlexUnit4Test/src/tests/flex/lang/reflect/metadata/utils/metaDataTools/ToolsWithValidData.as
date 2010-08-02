package tests.flex.lang.reflect.metadata.utils.metaDataTools
{
	import flex.lang.reflect.utils.MetadataTools;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNull;
	import org.flexunit.asserts.assertTrue;
	
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
		
		[Test]
		public function shouldReturnListIfMethodsDefined():void {
			var methodXML0:XML = <method name="myFirstMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
									<metadata name="Test">
										<arg key="description" value="First description"/>
									</metadata>
								</method>;
			var methodXML1:XML = <method name="mySecondMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
									<metadata name="Async">
										<arg key="description" value="Second description"/>
									</metadata>
								</method>;
			
			var descXML:XML = <classxml name="MyClass" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void"/>;
				
			descXML.appendChild( methodXML0 );
			descXML.appendChild( methodXML1 );
			
			var expectedMethodXMLList:XMLList = new XMLList();
			expectedMethodXMLList[0] = methodXML0;
			expectedMethodXMLList[1] = methodXML1;
			
			assertEquals( expectedMethodXMLList, MetadataTools.getMethodsList(descXML) );
		}
		
		[Test]
		public function shouldReturnTrueIfNodeParentMatch():void {
			var methodXML0:XML = 	<method name="myFirstMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName1">
											<arg key="description" value="DescriptionMock"/>
										</metadata>
									</method>;
			var methodXML1:XML = 	<method name="mySecondMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName2">
											<arg key="description" value="DescriptionMock2"/>
										</metadata>
									</method>;
			
			var methodXMLList:XMLList = new XMLList();
			methodXMLList[0] = methodXML0;
			methodXMLList[1] = methodXML1;
			
			var expectedMethodXMLList:XMLList = new XMLList();
			expectedMethodXMLList[0] = methodXML1;

			assertEquals( expectedMethodXMLList, MetadataTools.getMethodsDecoratedBy(methodXMLList, "MyName2") );
			
		}
		
		[Test]
		public function shouldReturnEmptyListIfNodeParentNoMatch():void {
			var methodXML0:XML = 	<method name="myFirstMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName1">
											<arg key="description" value="DescriptionMock"/>
										</metadata>
									</method>;
			var methodXML1:XML = 	<method name="mySecondMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName2">
											<arg key="description" value="DescriptionMock2"/>
										</metadata>
									</method>;
			
			var methodXMLList:XMLList = new XMLList();
			methodXMLList[0] = methodXML0;
			methodXMLList[1] = methodXML1;
			
			var expectedMethodXMLList:XMLList = new XMLList();
			
			assertEquals( expectedMethodXMLList, MetadataTools.getMethodsDecoratedBy(methodXMLList, "MyName3") );
		}
		
		[Test]
		public function shouldReturnTwoItemListIfTwoNodesHaveSameParent():void {
			var methodXML0:XML = 	<method name="myFirstMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName">
											<arg key="description" value="DescriptionMock"/>
										</metadata>
									</method>;
			var methodXML1:XML = 	<method name="mySecondMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="String"> 
										<metadata name="MyName">
											<arg key="description" value="DescriptionMock2"/>
										</metadata>
									</method>;
			
			var methodXMLList:XMLList = new XMLList();
			methodXMLList[0] = methodXML0;
			methodXMLList[1] = methodXML1;
			
			var expectedMethodXMLList:XMLList = new XMLList();
			expectedMethodXMLList[0] = methodXML0;
			expectedMethodXMLList[1] = methodXML1;
			
			assertEquals( expectedMethodXMLList, MetadataTools.getMethodsDecoratedBy(methodXMLList, "MyName") );
			assertEquals( 2, MetadataTools.getMethodsDecoratedBy(methodXMLList, "MyName" ).length() );
		}
		
		[Test]
		public function shouldReturnTrueIfMetaDataNameMatch():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<metadata name="MyName">
										<arg key="description" value="DesciptionMock"/>
									</metadata>
								</method>;
			
			assertTrue( MetadataTools.nodeHasMetaData( nodeXML, "MyName" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfMetaDataNameNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<metadata name="MyName">
										<arg key="description" value="DesciptionMock"/>
									</metadata>
								</method>;
			
			assertFalse( MetadataTools.nodeHasMetaData( nodeXML, "MyName2" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfMetaDataIsBlank():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<metadata name="">
										<arg key="description" value="DesciptionMock"/>
									</metadata>
								</method>;
			
			assertTrue( MetadataTools.nodeHasMetaData( nodeXML, "" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfMethodParameterDefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<parameter name="param1"/>
								</method>;
			
			assertTrue( MetadataTools.doesMethodAcceptsParams( nodeXML ) );
		}
		
		[Test]
		public function shouldReturnTrueIfParameterNameBlank():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<parameter/>
								</method>;
			
			assertTrue( MetadataTools.doesMethodAcceptsParams( nodeXML ) );
		}
		
		[Test]
		public function shouldReturnTrueForTwoParametersDefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<parameter name="param1"/>
									<parameter name="param2"/>
								</method>;
			
			assertTrue( MetadataTools.doesMethodAcceptsParams( nodeXML ) );
		}
		
		[Test]
		public function shouldReturnTrueForOneParameterNamed():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void">
									<parameter/>
									<parameter name="param2"/>
								</method>;
			
			assertTrue( MetadataTools.doesMethodAcceptsParams( nodeXML ) );
		}
		
		[Test]
		public function shouldReturnFalseIfParameterUndefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void"/>;
			
			assertFalse( MetadataTools.doesMethodAcceptsParams( nodeXML ) );
		}
		
		[Test]
		public function shouldReturnIfReturnTypeDefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase" returnType="void"/>;
			
			assertEquals( MetadataTools.getMethodReturnType( nodeXML ), "void" );
		}
		
		[Test]
		public function shouldReturnBlankIfReturnTypeUndefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;
			
			assertEquals( MetadataTools.getMethodReturnType( nodeXML ), "" );
		}
		
		[Test]
		public function shouldReturnIfMetaDataDefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase">
									<metadata name="MyName"/>
								</method>;	
			
			var resultXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.nodeMetaData( nodeXML ), resultXMLList );

		}
		
		[Test]
		public function shouldReturnLengthTwoIfTwoMetaDataDefined():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase">
									<metadata name="MyName"/>
									<metadata name="MyName2"/>
								</method>;	
			
			var resultXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.nodeMetaData( nodeXML ), resultXMLList );
			assertEquals( MetadataTools.nodeMetaData( nodeXML ).length(), 2 );
		}
		
		[Test]
		public function shouldReturnIfMetaDataUnnamed():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase">
									<metadata/>
								</method>;	
			
			var resultXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.nodeMetaData( nodeXML ), resultXMLList );
			
		}
		
		[Test]
		public function shouldReturnNodeIfNameMatch():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name="MyName"/>;
			var metaData2XML:XML = <metadata name="MyName2"/>;
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			var argXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.getMetaDataNodeFromNodesList( argXMLList, "MyName" ), metaData1XML );
		}
		
		[Test]
		public function shouldReturnFirstNodeWhereNameMatch():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name="MyName"/>;
			var metaData2XML:XML = <metadata name="MyName2"/>;
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			var argXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.getMetaDataNodeFromNodesList( argXMLList, "MyName2" ), metaData2XML );
		}
		
		[Test]
		public function shouldReturnNullIfNameNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name="MyName"/>;
			var metaData2XML:XML = <metadata name="MyName2"/>;
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			var argXMLList:XMLList = nodeXML.metadata;
			
			assertNull( MetadataTools.getMetaDataNodeFromNodesList( argXMLList, "MyName3" ) );
		}
		
		[Test]
		public function shouldReturnNodeWhereNameIsBlank():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name=""/>;
			var metaData2XML:XML = <metadata name="MyName2"/>;
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			var argXMLList:XMLList = nodeXML.metadata;
			
			assertEquals( MetadataTools.getMetaDataNodeFromNodesList( argXMLList, "" ), metaData1XML );
		}
		
		[Test]
		public function shouldReturnMetaDataIfNameIsPassedIn():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaDataXML:XML = <metadata name="MyName"/>;
			
			nodeXML.appendChild( metaDataXML );
			
			assertEquals( MetadataTools.getArgsFromFromNode( nodeXML, "MyName" ), metaDataXML );
		}
		
		[Test]
		public function shouldReturnFirstNodeWhereMetaDataNameIsPassedIn():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name="MyName"/>;
			var metaData2XML:XML = <metadata name="MyName2"/>
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			assertEquals( MetadataTools.getArgsFromFromNode( nodeXML, "MyName2" ), metaData2XML );
		}
		
		[Test]
		public function shouldReturnNodeIfNameBlank():void {
			var nodeXML:XML = 	<method name="MyMethod" declaredBy="flex.lang.reflect.cases::MethodCase"/>;	
			
			var metaData1XML:XML = <metadata name=""/>;
			var metaData2XML:XML = <metadata name="MyName2"/>
			
			nodeXML.appendChild( metaData1XML );
			nodeXML.appendChild( metaData2XML );
			
			assertEquals( MetadataTools.getArgsFromFromNode( nodeXML, "" ), metaData1XML );
		}
		
		[Test]
		public function shouldReturnTrueIfMetaDataValueMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertTrue( MetadataTools.checkForValueInBlankMetaDataNode( nodeXML, "MyName", "ValueMock" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfMetaDataValueNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertFalse( MetadataTools.checkForValueInBlankMetaDataNode( nodeXML, "MyName", "ValueMock2" ) );
		}
		
		[Test]
		public function shouldReturnFalseIfMetaDataNameCheckNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertFalse( MetadataTools.checkForValueInBlankMetaDataNode( nodeXML, "MyName2", "ValueMock" ) );	
		}
		
		[Test]
		public function shouldReturnFalseIfArgKeyDefined():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="MyKey" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertFalse( MetadataTools.checkForValueInBlankMetaDataNode( nodeXML, "MyName", "ValueMock" ) );
		}
		
		[Test]
		public function shouldReturnValueIfMetaDataArgKeyMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="MyKey" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertEquals( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "MyKey" ), "ValueMock" );
		}
		
		[Test]
		public function shouldReturnNullIfMetaDataArgKeyNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="MyKey" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName", "MyKey2" ) );
		}
		
		[Test]
		public function shouldReturnNullForArgIfMetaDataNameNoMatch():void {
			var nodeXML:XML = 	<method name="MyMethod">
									<metadata name="MyName">
										<arg key="MyKey" value="ValueMock"/>
									</metadata>
								</method>;
			
			assertNull( MetadataTools.getArgValueFromMetaDataNode( nodeXML, "MyName2", "MyKey" ) );
		}
		
		[Test]
		public function shouldReturnTrueIfArgKeyPassedIn():void {
			var nodeXML:XML = 	<metadata name="MyName">
									<arg key="MyKey" value="ValueMock"/>
								</metadata>;
			
			assertEquals( MetadataTools.getArgValueFromSingleMetaDataNode( nodeXML, "MyKey" ), "ValueMock" );
		}
	}
}