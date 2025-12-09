package akshare

func newSys(options *Options) (sys *AkShare, err error) {
	sys = &AkShare{
		options: options,
	}
	return
}

type AkShare struct {
	options *Options
}
