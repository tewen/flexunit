package tests.flex.lang.metadata {
	import tests.flex.lang.metadata.metaDataAnnotation.AnnotationWithInvalidData;
	import tests.flex.lang.metadata.metaDataAnnotation.AnnotationWithValidData;
	import tests.flex.lang.metadata.metaDataArgument.ArgumentWithInvalidData;
	import tests.flex.lang.metadata.metaDataArgument.ArgumentWithValidData;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MetaDataSuite {
		public var validDataArgument:ArgumentWithValidData;
		public var invalidDataArgument:ArgumentWithInvalidData;
		public var validDataAnnotation:AnnotationWithValidData;
		public var invalidDataAnnotation:AnnotationWithInvalidData;
	}
}