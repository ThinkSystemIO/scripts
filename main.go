package main

import (
	"flag"
	"fmt"
	"log"
	"os/exec"
	"strings"
)

func main() {
	path := flag.String("p", "", "path to helm chart")
	name := flag.String("n", "", "name of image")
	version := flag.String("v", "", "version number of image")
	flag.Parse()

	if *path == "" || *name == "" || *version == "" {
		log.Fatalln("path (-p), name (-n), version (-v) must be specified via flags")
	}

	commands := []string{
		fmt.Sprintf("helm chart save %s us-central1-docker.pkg.dev/thinksystemio/images/%s:%s", *path, *name, *version),
		fmt.Sprintf("helm chart push us-central1-docker.pkg.dev/thinksystemio/images/%s:%s", *name, *version),
	}

	for _, command := range commands {
		cmd := strings.Fields(command)
		execute(cmd)
	}
}

func execute(command []string) {
	cmd := exec.Command(command[0], command[1:]...)
	stdoutStderr, err := cmd.CombinedOutput()
	fmt.Printf("%s\n", stdoutStderr)
	if err != nil {
		log.Fatalln(err)
	}
}
