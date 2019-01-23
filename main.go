package main

import (
	"log"

	common "github.com/enfipy/tesimp/schema/gen/common/go"
	"github.com/enfipy/tesimp/schema/gen/test1/go"
	"github.com/enfipy/tesimp/schema/gen/test2/go"
)

func main() {
	t1 := test1.Test1{Test: new(common.TestCommon)}
	log.Printf("Test1: %v", t1.Test.Foo)

	t2 := test2.Test2{Test: new(common.TestCommon)}
	log.Printf("Test2: %v", t2.Test.Bar)
}
