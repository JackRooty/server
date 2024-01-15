package main

import (
	"fmt"
    "log"
    "net/http"
)

func main() {

	fileServer := http.FileServer(http.Dir("./content"))
    http.Handle("/message", fileServer)

    http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		log.Print("request from address: ", r.RemoteAddr)
        w.WriteHeader(http.StatusOK)
    })
	fmt.Println("Server started at port 8080")
    log.Println("Listening...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}