package main

import (
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
    "time"
)

const (
	BASEURL  = "http://www.bz55.com"
	DOWNPATH = "/Users/didi/goproj/src/grub/image/"
    CHANNEL_CACHE_LENGTH = 20
)

var urlChl chan string

func findElement(pageUrl string) {
	doc, err := goquery.NewDocument(pageUrl)
	if err != nil {
		log.Fatal(err)
	}

	doc.Find("p").Eq(2).Find("img").Each(func(i int, s *goquery.Selection) {
		src, find := s.Attr("src")
		if find {
			logOut("parse order: " + src)
			urlChl <- src
			downFile(src)
		}
	})
}

func downFile(fileUrl string) {
	fullUrl := BASEURL + fileUrl
	//path, filename := filepath.Split(fullUrl)
	_, filename := filepath.Split(fullUrl)
    file := DOWNPATH + filename
    logOut(file + " now is downloading ... ...")
	res, err := http.Get(fullUrl)
	if err != nil {
		log.Fatal("down file error, url:" + fullUrl)
	}
	defer res.Body.Close()
	f, err := os.Create(file)
	if err != nil {
		log.Fatal("create file wrong")
	}
	defer f.Close()
	io.Copy(f, res.Body)
    logOut(file + " now is download finished")
}

func outChannel() {
    i := 0
	for {
        i++
        logOut(fmt.Sprintf("loop: %d", i))
		select {
		    case url := <-urlChl:
                downFile(url)
		}
	}
}

func logOut(s string) {
    fmt.Printf("%+v\t%s\n", time.Now().UnixNano(), s)
}

func main() {
    urls := []string{
        "http://www.bz55.com/meinvbizhi/38925.html",
        "http://www.bz55.com/meinvbizhi/38872.html",
        "http://www.bz55.com/meinvbizhi/38818.html",
    }

	go outChannel()
	urlChl = make(chan string, CHANNEL_CACHE_LENGTH)
    for i, url := range urls {
        fmt.Printf("%v\t%#v\n", i, string(url) )
        findElement(string(url))
    }
}
