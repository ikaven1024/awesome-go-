package version

var (
	buildDate = "UNKNOWN"
	gitCommit = "UNKNOWN"
	gitTreeState = "UNKNOWN"
	gitVersion = "UNKNOWN"
)

func Version() string {
	return gitVersion
}