package tests.flex.lang.metadata {
	import tests.flex.lang.metadata.metaDataAnnotation.InvalidDataForAnnotations;
	import tests.flex.lang.metadata.metaDataAnnotation.ValidDataForAnnotation;
	import tests.flex.lang.metadata.metaDataArgument.InvalidDataForArgument;
	import tests.flex.lang.metadata.metaDataArgument.ValidDataForArgument;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MetaDataSuite {
		public var validDataArgument:ValidDataForArgument;
		public var invalidDataArgument:InvalidDataForArgument;
		public var validDataAnnotation:ValidDataForAnnotation;
		public var invalidDataAnnotation:InvalidDataForAnnotations;
	}
}