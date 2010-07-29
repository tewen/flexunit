package tests.flex.lang.reflect.metadata {
	import tests.flex.lang.reflect.metadata.metaDataAnnotation.AnnotationWithInvalidData;
	import tests.flex.lang.reflect.metadata.metaDataAnnotation.AnnotationWithValidData;
	import tests.flex.lang.reflect.metadata.metaDataArgument.ArgumentWithInvalidData;
	import tests.flex.lang.reflect.metadata.metaDataArgument.ArgumentWithValidData;
	import tests.flex.lang.reflect.metadata.utils.MetaDataToolsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MetaDataSuite {
		public var validDataArgument:ArgumentWithValidData;
		public var invalidDataArgument:ArgumentWithInvalidData;
		public var validDataAnnotation:AnnotationWithValidData;
		public var invalidDataAnnotation:AnnotationWithInvalidData;
		public var utils:MetaDataToolsSuite;
	}
}