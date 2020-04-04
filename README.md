# Go WebAssembly Calculator Starter Kit

This starter kit enables Go development for WebAssembly.

This starter kit was built on April 3, 2020.

It was built with the following dependencies in mind:

- Go 1.13.9
- `sh`, `bash`, `zsh`
- `curl`
- Uses POSIX/LINUX/UNIX `ln` hard links, but you can change the scripts to use `cp` instead.

## Building

I used JetBrains GoLand. The `.idea` folder should be configured properly to build.

If you need to manually build it, here are the steps:

### `chmod` the Scripts

Make sure you can run the scripts.

    chmod +x ./scripts/*.sh

### Clean Build

From the project root, run the script:

    ./scripts/clean.sh
    
### Build WebAssembly

From the project root, compile the WebAssembly:

    GOOS=js GOARCH=wasm go build -i -o build/lib.wasm src/main.go

### Build Web Distribution

From the project root, run the script:

    ./scripts/copy_assets.sh

The final product will be located in the `./dist` directory.

### Build Testing Server (optional)

If you would like to build a testing server, compile the server:

    go build -i -o bin/server server/server.go

You can then run the testing server:

    ./bin/server --dir ./dist
    
Then you can browse to the test web site at http://localhost:8080.

### Edit and Enjoy!

That's it! You can run Go code in your web browser.

The source code is in `./src`. The web assets are in `./assets`.

## MIT License

Copyright 2020 David Ball.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### But, really...

Do what you want to with it, just don't blame me if it breaks.