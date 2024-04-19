// Launch microservice server- main.go
package main

import (
	"log"
	"microservice"
)

func main() {
	s := microservice.NewServer("", "8000")
	log.Fatal(s.ListenAndServe())
}
