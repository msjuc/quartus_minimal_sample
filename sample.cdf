JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);
	P ActionCode(Cfg)
		Device PartName(5CGXFC5C6F27) Path("/path/to/parent/folder/with/design/files/") File("sample.sof") MfrSpec(OpMask(1));
ChainEnd;
AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
