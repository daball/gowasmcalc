if (!WebAssembly.instantiateStreaming) {
    // polyfill
    WebAssembly.instantiateStreaming = async (resp, importObject) => {
        const source = await (await resp).arrayBuffer();
        return await WebAssembly.instantiate(source, importObject);
    };
}

const go = new Go();

let mod, inst;

WebAssembly.instantiateStreaming(fetch("/wasm/lib.wasm"), go.importObject).then(
    result => {
        mod = result.module;
        inst = result.instance;
        run();
    }
);

async function run() {
    await go.run(inst);
    inst = await WebAssembly.instantiate(mod, go.importObject); // reset instance
}