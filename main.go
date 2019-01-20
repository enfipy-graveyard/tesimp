package main

import (
	"log"

	"example/schema/gen/test1/go"
	"example/schema/gen/test2/go"
)

func main() {
	t1 := test1.Test1{Test: new(test1.TestCommon)}
	log.Printf("Test1: %v", t1.Test.Foo)

	t2 := test2.Test2{Test: new(test2.TestCommon)}
	log.Printf("Test2: %v", t2.Test.Bar)
}
