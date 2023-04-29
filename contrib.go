package maddy

import (
	"fmt"
	"runtime/debug"

	_ "github.com/sour-is/maddy-ws4sqlite/table"
)

func init() {
	b, ok := debug.ReadBuildInfo()
	if ok {
		for _, m := range b.Deps {
			fmt.Println(m.Path, "@", m.Version, "(", m.Replace, ")")
		}
	}
}
