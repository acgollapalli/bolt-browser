/*

SDG                                                                            JJ

Bindings to the WASM Micro Runtime (WAMR)

The wasm-micro-runtime can be found at:
    https://github.com/bytecodealliance/wasm-micro-runtime

If you cloned the submodules, the source code for the wamr can be conveniently 
found in:
    external/wasm-micro-runtime/

You'll need to build the library for your target platform. The header files 
may be found in:
    external/wasm-micro-runtime/core/iwasm/include/

Currently we only use wasm_export.h

*/

package wamr

LIBIWASM : string

when ODIN_OS == .Darwin {
	LIBIWASM = "external/wasm-micro-runtime/build/libiwasm.dylib"
}

foreign import libiwasm {
	LIBIWASM
}

NativeSymbol :: struct {
	symbol: cstring,
	fn_ptr: rawptr,
	signature: cstring,
}

wasm_module_t :: distinct rawptr
Module :: wasm_module_t

wasm_module_inst_t :: distinct rawptr
ModuleInstance :: wasm_module_inst_t

wasm_exec_env :: distinct rawptr
ExecEnv :: wasm_exec_env

@(link_prefix="wasm-", default_calling_convention="c")
foreign libiwasm {
	// runtime initialization
	runtime_init :: proc() ---
	runtime_register_natives :: proc( native_symbols: [^]NativeSymbol) ---
	runtime_load :: proc(buffer: [^]u8, size: u32, error_buf: [^]u8, error_buf_size: u32) -> Module ---
	runtime_instantiate :: proc(module: Module, default_stack_size: u32, host_managed_heap_size: u32, error_buf: [^]u8, error_buf_size: u32)  -> ModuleInst ---
	runtime_get_module_inst :: proc(exec_env: ExecEnv) -> ModuleInstance ---
	// bounds checking and pointer translation for returned values
	runtime_validate_app_str_add :: proc(module_inst: ModuleInstance, app_str_offset: u64) -> bool ---
	runtime_validate_app_add :: proc(module_inst: ModuleInstance, app_addr_offset: u64, size: u64) -> bool ---
	runtime_addr_app_to_native :: proc(module_inst: ModuleInstance, app_offset: u64) -> rawptr ---
}

// some utility functions to make our life a bit easier
bounds_check :: proc(exec_env: ExecEnv, data: int, #any_int size: int) -> (data_nativePtr: rawptr, ok: bool) {
	module := runtime_get_module_inst(exec_env)
	data_wasmPtr := transmute(u64)data
	size_sizePtr := transmute(u64)size

	wamr.runtime_validate_app_addr(module, data_wasmPtr, size_sizePtr) or_return
	data_nativePtr = wamr.runtime_addr_app_to_native(module, data_wasmPtr)
	ok = true
	return
}

