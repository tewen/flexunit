package flex.lang.reflect.builders {
	import flex.lang.reflect.Method;
	import flex.lang.reflect.utils.MetadataTools;

	public class MethodBuilder {
		private var classXML:XML;
		private var inheritance:Array;

		public function buildMethod( methodData:XML, isStatic:Boolean ):Method {
			return new Method( methodData, isStatic );
		}
		
		public function buildMethods( methodData:XMLList, isStatic:Boolean = false ):Array {
			var methods:Array = new Array();
			var methodList:XMLList = new XMLList();
			
			if ( XMLList( methodData ).length() > 0 ) {
				methodList = MetadataTools.getMethodsList( methodData[ 0 ] );
			}
			
			for ( var i:int=0; i<methodList.length(); i++ ) {
				methods.push( buildMethod( methodList[ i ], isStatic ) );
			}
			
			return methods;
		}

		public function buildAllMethods():Array {
			var methods:Array = new Array();
			var methodList:XMLList = new XMLList();

			buildMethods( classXML.factory )
			
			var staticMethodList:XMLList = new XMLList();		
			staticMethodList = MetadataTools.getMethodsList( classXML );
			
			for ( var j:int=0; j<staticMethodList.length(); j++ ) {
				methods.push( buildMethod( staticMethodList[ j ], true ) );
			}
			
			return methods;
		}
		
		public function MethodBuilder( classXML:XML, inheritance:Array ) {
			this.classXML = classXML;
			this.inheritance = inheritance; 
		}
	}
}