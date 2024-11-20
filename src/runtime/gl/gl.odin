/*

SDG                                                                            JJ

This is  an implemntation of the wasl_gl standard. It is to be proposed as part
of WASI as something that may be implemented by all WebAssembly runtimes.

It will probably need to be broken out into its own repo eventually.

*/

package wasi_gl

import "runtime:wamr"
import gl "vendor:OpenGL"

/*

GLES 2.0 API begins here

*/


wamr_wasi_glActiveShader :: wamr.NativeSymbol {
	"wasi_glActiveShader",
	&ActiveShader,
	"(i)",
}

ActiveTexture :: proc "c" (exec_env: wamr.ExecEnv, texture: i32) {
	gl.ActiveTexture(transmute(u32)texture)
}

wamr_wasi_glAttachShader :: wamr.NativeSymbol {
	"wasi_glAttachShader",
	&AttachShader,
	"(ii)",
}

AttachShader :: proc "c" (exec_env: wamr.ExecEnv, program: i32, shader: i32) {
	gl.AttachShader(transmute(u32)program, transmute(u32)shader)
}

wamr_wasi_glBindAttribLocation :: wamr.NativeSymbol {
	"wasi_glBindAttribLocation",
	&BindAttribLocation,
	"(ii$)",
}

BindAttribLocation :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, index: i32,
	name: [^]string,
) {
	gl.BindAttribLocation(transmute(u32)program, transmute(u32)index, name)
}

wamr_wasi_glBinddBuffer :: wamr.NativeSymbol {
	"wasi_glBinddBuffer",
	&BinddBuffer,
	"(ii)",
}

BindBuffer :: proc "c" (exec_env: wamr.ExecEnv, target: i32, buffer: i32) {
	gl.BindBuffer(transmute(u32)target, transmute(u32)buffer)
}

wamr_wasi_glBindFrameBuffer :: wamr.NativeSymbol {
	"wasi_glBindFrameBuffer",
	&BindFrameBuffer,
	"(ii)",
}

BindFrameBuffer :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, framebuffer: i32,
) {
	gl.BindFrameBuffer(transmute(u32)target, transmute(u32)framebuffer)
}

wamr_wasi_glBindRenderBuffer :: wamr.NativeSymbol {
	"wasi_glBindRenderBuffer",
	&BindRenderBuffer,
	"(ii)",
}

BindRenderBuffer :: proc "c" (
	exec_env: wamr.ExecEnv,
	target: i32,
	renderbuffer: i32,
) {
	gl.BindRenderBuffer(transmute(u32)target, transmute(u32)renderbufffer)
}

wamr_wasi_glBindTexture :: wamr.NativeSymbol {
	"wasi_glBindTexture",
	&BindTexture,
	"(ii)",
}

BindTexture :: proc "c" (exec_env: wamr.ExecEnv, target: i32, texture: i32) {
	gl.BindTexture(transmute(u32)target, transmute(u32)texture)
}

wamr_wasi_glBlendColor :: wamr.NativeSymbol {
	"wasi_glBlendColor",
	&BlendColor,
	"(ffff)",
}

BlendColor :: proc "c" (exec_env: wamr.ExecEnv, red, green, blue, alpha: f32) {
	gl.BlendColor(red, green, blue, alpha)
}

wamr_wasi_glBlendEquation :: wamr.NativeSymbol {
	"wasi_glBlendEquation",
	&BlendEquation,
	"(i)",
}

BlendEquation :: proc "c" (exec_env: wamr.ExecEnv, mode: i32) {
	gl.BlendEquation(transmute(u32)mode)
}

wamr_wasi_glBlendEquationSeparate :: wamr.NativeSymbol {
	"wasi_glBlendEquationSeparate",
	&BlendEquationSeparate,
	"(ii)",
}

BlendEquationSeparate :: proc "c" (
	exec_env: wamr.ExecEnv,
	modeRGB, modeAlpha: i32,
) {
	gl.BlendEquationSeparate(transmute(u32)modeRGB, transmute(u32)modeAlpha)
}

wamr_wasi_glBlendFunc :: wamr.NativeSymbol {
	"wasi_glBlendFunc",
	&BlendFunc,
	"(ii)",
}

BlendFunc :: proc "c" (exec_env: wamr.ExecEnv, sfactor: i32, dfactor: i32) {
	gl.BlendFunc(transmute(u32)sfactor, transmute(u32)dfactor)
}

wamr_wasi_glBlendFuncSeparate :: wamr.NativeSymbol {
	"wasi_glBlendFuncSeparate",
	&BlendFuncSeparate,
	"(iiii)",
}

BlendFuncSeparate :: proc "c" (
	exec_env: wamr.ExecEnv,
	srcRGB, dstRGB, srcAlpha: i32,
) {
	gl.BlendFuncSeparate(
		transmute(u32)srcAlpha,
		transmute(u32)dstRGB,
		transmute(u32)srcRGB,
		transmute(u32)dstRGB,
	)
}

wamr_wasi_glBufferData :: wamr.NativeSymbol {
	"wasi_glBufferData",
	&BufferData,
	"(iIIi)",
}

BufferData :: proc "c" (
	exec_env: wamr.ExecEnv,
	target: i32,
	size, data: int,
	usage: i32,
) {
	data_nativePtr := wamr.bounds_check(exec_env, data, size) or_return
	gl.BufferData(
		transmute(u32)target,
		size_u32,
		data_nativePtr,
		transmute(u32)usage,
	)
}

wamr_wasi_glBufferSubData :: wamr.NativeSymbol {
	"wasi_glBufferSubData",
	&BufferSubData,
	"(iIII)",
}

BufferSubData :: proc "c" (
	exec_env: wamr.ExecEnv,
	target: i32,
	offset, size, data: int,
) {
	data_nativePtr := wamr.bounds_check(exec_env, data, size) or_return
	gl.BufferSubData(transmute(u32)target, offset, size, data_nativePtr)
}

wamr_wasi_glCheckFrameBufferStatus :: wamr.NativeSymbol {
	"wasi_glCheckFrameBufferStatus",
	&CheckFrameBufferStatus,
	"(i)i",
}

CheckFrameBufferStatus :: proc "c" (
	exec_env: wamr.ExecEnv,
	target: i32,
) -> i32 {
	status := gl.CheckFrameBufferStatus(transmute(u32)target)
	return transmute(i32)status
}

wamr_wasi_glClear :: wamr.NativeSymbol{"wasi_glClear", &Clear, "(i)"}

Clear :: proc "c" (exec_env: wamr.ExecEnv, mask: i32) {
	gl.Clear(transmute(u32)i32)
}

wamr_wasi_glClearColor :: wamr.NativeSymbol {
	"wasi_glClearColor",
	&ClearColor,
	"(ffff)",
}

ClearColor :: proc "c" (exec_env: wamr.ExecEnv, red, green, blue, alpha: f32) {
	gl.ClearColor(red, green, blue, alpha)
}

wamr_wasi_glClearDepthf :: wamr.NativeSymbol {
	"wasi_glClearDepthf",
	&ClearDepthf,
	"(f)",
}

ClearDepthf :: proc "c" (exec_env: wamr.ExecEnv, depth: f32) {
	gl.ClearDepthf(depth)
}

wamr_wasi_glClearStencil :: wamr.NativeSymbol {
	"wasi_glClearStencil",
	&ClearStencil,
	"(i)",
}

ClearStencil :: proc "c" (exec_env: wamr.ExecEnv, s: i32) {
	gl.ClearStencil(s)
}

wamr_wasi_glColorMask :: wamr.NativeSymbol {
	"wasi_glColorMask",
	&ColorMask,
	"(iiii)",
}

// FIXME: Find a better way to pass bools
ColorMask :: proc "c" (exec_env: wamr.ExecEnv, red, green, blue, alpha: i32) {
	gl.ColorMask(bool(red), bool(green), bool(blue), bool(alpha))
}

wamr_wasi_glCompileShader :: wamr.NativeSymbol {
	"wasi_glCompileShader",
	&CompileShader,
	"(i)",
}

CompileShader :: proc "c" (exec_env: wamr.ExecEnv, shader: i32) {
	gl.CompileShader(transmute(u32)shader)
}

wamr_wasi_glCompressedTexImage2D :: wamr.NativeSymbol {
	"wasi_glCompressedTexImage2D",
	&CompressedTexImage2D,
	"(iiiiiiiI)",
}

CompressedTexImage2D :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, internalformat, width, height, border, imageSize: i32,
	data: int,
) {
	bufferBound: bool
	data_ptr: rawptr

	// the data param can be a pointer to memory or a byte offset to already
	// mapped memory. It's an offset when GL_PIXEL_UNPACK_BUFFER_BINDING is
	// bound
	gl.GetBooleanv(gl.PIXEL_UNPACK_BUFFER_BINDING, &bufferBound)
	if (!bufferBound) {
		data_ptr = waml.bounds_check(exec_env, data, int(imageSize)) or_return
	} else {
		data_ptr = transmute(rawptr)data
	}
	gl.CompressedTexImage2D(
		transmute(u32)target,
		level,
		transmute(u32)target,
		width,
		heigh,
		border,
		imageSize,
		data_ptr,
	)
}

wamr_wasi_glCompressedTexSubImage :: wamr.NativeSymbol {
	"wasi_glCompressedTexSubImage",
	&CompressedTexSubImage,
	"(iiiiiiiiI)",
}

CompressedTexSubImage :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, xoffset, yoffset, width, height, format, imageSize: i32,
	data: int,
) {
	data_ptr: rawptr
	bufferBound: bool
	// the data param can be a pointer to memory or a byte offset to already
	// mapped memory. It's an offset when GL_PIXEL_UNPACK_BUFFER_BINDING is
	// bound
	gl.GetBooleanv(gl.PIXEL_UNPACK_BUFFER_BINDING, &bufferBound)
	if (!bufferBound) {
		data_ptr = waml.bounds_check(exec_env, data, int(imageSize)) or_return
	} else {
		data_ptr = transmute(rawptr)data
	}
	gl.CompressedTexSubImage(
		transmute(u32)target,
		level,
		xoffset,
		yoffset,
		width,
		height,
		transmute(u32)format,
		imageSize,
		data_ptr,
	)
}

wamr_wasi_glCopyTexImage2d :: wamr.NativeSymbol {
	"wasi_glCopyTexImage2d",
	&CopyTexImage2d,
	"(iiiiiiii)",
}

CopyTexImage2d :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, internalformat, x, y, width, height, border: i32,
) {
	gl.CopyTexImage2d(
		transmute(u32)target,
		level,
		transmute(u32)internalformat,
		x,
		y,
		width,
		height,
		border,
	)
}

wamr_wasi_glCopyTexSubImage2D :: wamr.NativeSymbol {
	"wasi_glCopyTexSubImage2D",
	&CopyTexSubImage2D,
	"(iiiiiiii)",
}

CopyTexSubImage2D :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, xoffset, yoffset, x, y, width, height: i32,
) {
	data_ptr: rawptr

	gl.CopyTexSubImage2D(
		transmute(u32)target,
		level,
		xoffset,
		yoffset,
		x,
		y,
		width,
		height,
	)
}

wamr_wasi_glCreateProgram :: wamr.NativeSymbol{"wasi_glSomeFn", &SomeFn, "()i"}

CreateProgram :: proc "c" (exec_env: wamr.ExecEnv) -> i32 {
	program := gl.CreateProgram()
	return transmute(i32)program
}

wamr_wasi_glCreateShader :: wamr.NativeSymbol {
	"wasi_glCreateShader",
	&CreateShader,
	"(i)i",
}

CreateShader :: proc "c" (exec_env: wamr.ExecEnv, shaderType: i32) -> i32 {
	shader := gl.CreateShader(transmute(u32)shaderType)
	return transmute(i32)shader
}

wamr_wasi_glCullFace :: wamr.NativeSymbol{"wasi_glCullFace", &CullFace, "(i)"}

CullFace :: proc "c" (exec_env: wamr.ExecEnv, mode: i32) {
	gl.CullFace(transmute(u32)i32)
}

wamr_wasi_glDeleteBuffers :: wamr.NativeSymbol {
	"wasi_glDeleteBuffers",
	&DeleteBuffers,
	"(iI)",
}

DeleteBuffers :: proc "c" (exec_env: wamr.ExecEnv, n: i32, buffers: int) {
	buffers_rawptr := wamr.bounds_check(buffers, int(n) * 4) or_return
	buffers_ptr := transmute([^]u32)buffers_rawptr

	gl.DeleteBuffers(n, buffers_ptr)
}

wamr_wasi_glDeleteFramebuffers :: wamr.NativeSymbol {
	"wasi_glDeleteFramebuffers",
	&DeleteFramebuffers,
	"(iI)",
}

DeleteFramebuffers :: proc "c" (
	exec_env: wamr.ExecEnv,
	n: i32,
	framebuffers: i32,
) {
	framebuffers_rawptr := wamr.bounds_check(framebuffers, int(n) * 4) or_return
	framebuffers_ptr := transmute([^]u32)framebuffers_rawptr

	gl.DeleteFramebuffers(n, framebuffers_ptr)
}

wamr_wasi_glDeleteProgram :: wamr.NativeSymbol {
	"wasi_glDeleteProgram",
	&DeleteProgram,
	"(i)",
}

DeleteProgram :: proc "c" (exec_env: wamr.ExecEnv, program: i32) {
	gl.DeleteProgram(transmute(u32)program)
}

wamr_wasi_glDeleteRenderbuffers :: wamr.NativeSymbol {
	"wasi_glDeleteRenderbuffers",
	&DeleteRenderbuffers,
	"(iI)",
}

DeleteRenderbuffers :: proc "c" (
	exec_env: wamr.ExecEnv,
	n: i32,
	renderbuffers: int,
) {
	renderbuffers_rawptr := wamr.bounds_check(
		renderbuffers,
		int(n) * 4,
	) or_return
	renderbuffers_ptr := transmute([^]u32)renderbuffers_rawptr

	gl.DeleteRenderbuffers(n, renderbuffers_ptr)
}

wamr_wasi_glDeleteShader :: wamr.NativeSymbol {
	"wasi_glDeleteShader",
	&DeleteShader,
	"(i)",
}

DeleteShader :: proc "c" (exec_env: wamr.ExecEnv, shader: i32) {
	gl.DeleteShader(transmute(u32)shader)
}

wamr_wasi_glDeleteTextures :: wamr.NativeSymbol {
	"wasi_glDeleteTextures",
	&DeleteTextures,
	"(iI)",
}

DeleteTextures :: proc "c" (exec_env: wamr.ExecEnv, n: i32, textures: int) {
	textures_rawptr := wamr.bounds_check(textures, int(n) * 4) or_return
	textures_ptr := transmute([^]u32)textures_rawptr

	gl.DeleteTextures(n, textures_ptr)
}

wamr_wasi_glDepthFunc :: wamr.NativeSymbol {
	"wasi_glDepthFunc",
	&DepthFunc,
	"(i)",
}

DepthFunc :: proc "c" (exec_env: wamr.ExecEnv, func: i32) {
	gl.DepthFunc(transmute(u32)func)
}

wamr_wasi_glDepthMask :: wamr.NativeSymbol {
	"wasi_glDepthMask",
	&DepthMask,
	"(i)",
}

DepthMask :: proc "c" (exec_env: wamr.ExecEnv, flag: i32) {
	gl.DepthMask(bool(flag))
}

wamr_wasi_glDepthRangeof :: wamr.NativeSymbol {
	"wasi_glDepthRangeof",
	&DepthRangeof,
	"(ff)",
}

DepthRangeof :: proc "c" (exec_env: wamr.ExecEnv, n, f: f32) {
	gl.DepthRangeof(n, f)
}

wamr_wasi_glDetachShader :: wamr.NativeSymbol {
	"wasi_glDetachShader",
	&DetachShader,
	"(ii)",
}

DetachShader :: proc "c" (exec_env: wamr.ExecEnv, program, shader: i32) {
	gl.DetachShader(transmute(u32)program, transmute(u32)shader)
}

wamr_wasi_glDisable :: wamr.NativeSymbol{"wasi_glDisable", &Disable, "(i)"}

Disable :: proc "c" (exec_env: wamr.ExecEnv, cap: i32) {
	gl.Disable(transmute(u32)cap)
}

wamr_wasi_glDisableVertexAttribArray :: wamr.NativeSymbol {
	"wasi_glDisableVertexAttribArray",
	&DisableVertexAttribArray,
	"(i)",
}

DisableVertexAttribArray :: proc "c" (exec_env: wamr.ExecEnv, index: i32) {
	gl.DisableVertexAttribArray(transmute(u32)index)
}

wamr_wasi_glDrawArrays :: wamr.NativeSymbol {
	"wasi_glDrawArrays",
	&DrawArrays,
	"(iii)",
}

DrawArrays :: proc "c" (exec_env: wamr.ExecEnv, mode, first, count: i32) {
	gl.DrawArrays(transmute(u32)mode, first, count)
}

wamr_wasi_glDrawElements :: wamr.NativeSymbol {
	"wasi_glDrawElements",
	&DrawElements,
	"(iiiI)",
}

DrawElements :: proc "c" (
	exec_env: wamr.ExecEnv,
	mode, count, type: i32,
	indices: int,
) {
	glMode := transmute(u32)mode
	glType := transmute(u32)type

	element_size: int
	switch glType {
	case gl.UNSIGNED_BYTE:
		element_size = 1
	case gl.UNSIGNED_SHORT:
		element_size = 2
	case gl.UNSIGNED_INT:
		element_size = 4
	}

	indices_ptr: rawptr
	buffer_bound: bool
	gl.GetBooleanv(gl.ELEMENT_ARRAY_BUFFER, &buffer_bound)
	if (!buffer_bound) {
		indices_ptr = waml.bounds_check(
			exec_env,
			indices,
			int(count) * element_size,
		) or_return
	} else {
		indices_ptr = transmute(rawptr)indices
	}

	gl.DrawElements(glMode, count, glType, indices_ptr)
}

wamr_wasi_glEnable :: wamr.NativeSymbol{"wasi_glEnable", &Enable, "(i)"}

Enable :: proc "c" (exec_env: wamr.ExecEnv, cap: i32) {
	gl.Enable(transmute(u32)cap)
}

wamr_wasi_glEnableVertexAttribArray :: wamr.NativeSymbol {
	"wasi_glEnableVertexAttribArray",
	&EnableVertexAttribArray,
	"(i)",
}

EnableVertexAttribArray :: proc "c" (exec_env: wamr.ExecEnv, index: i32) {
	gl.EnableVertexAttribArray(transmute(u32)index)
}

wamr_wasi_glFinish :: wamr.NativeSymbol{"wasi_glFinish", &Finish, "()"}

Finish :: proc "c" (exec_env: wamr.ExecEnv) {
	gl.Finish()
}

wamr_wasi_glFlush :: wamr.NativeSymbol{"wasi_glFlush", &Flush, "()"}

Flush :: proc "c" (exec_env: wamr.ExecEnv) {
	gl.Flush()
}

wamr_wasi_glFramebufferRenderbuffer :: wamr.NativeSymbol {
	"wasi_glFramebufferRenderbuffer",
	&FramebufferRenderbuffer,
	"(iiii)",
}

FramebufferRenderbuffer :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, attachment, renderbuffertarget, renderbuffer: i32,
) {
	gl.FramebufferRenderbuffer(
		transmute(u32)target,
		transmute(u32)attachment,
		transmute(u32)renderbuffertarget,
		transmute(u32)renderbuffer,
	)
}

wamr_wasi_glFramebufferTexture2D :: wamr.NativeSymbol {
	"wasi_glFramebufferTexture2D",
	&FramebufferTexture2D,
	"(iiiii)",
}

FramebufferTexture2D :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, attachment, textarget, texture, level: i32,
) {
	gl.FramebufferTexture2D(
		transmute(u32)target,
		transmute(u32)attachment,
		transmute(u32)textarget,
		transmute(u32)texture,
		level,
	)
}

wamr_wasi_glFrontFace :: wamr.NativeSymbol {
	"wasi_glFrontFace",
	&FrontFace,
	"(i)",
}

FrontFace :: proc "c" (exec_env: wamr.ExecEnv, mode: i32) {
	gl.FrontFace(transmute(u32)mode)
}

wamr_wasi_glGenBuffers :: wamr.NativeSymbol {
	"wasi_glGenBuffers",
	&GenBuffers,
	"(iI)",
}

GenBuffers :: proc "c" (exec_env: wamr.ExecEnv, n: i32, buffers: i64) {
	buffers_rawptr := wamr.bounds_check(exec_env, buffers, int(n) * 4) or_return
	buffers_ptr := transmute([^]u32)buffers_rawptr
	gl.GenBuffers(n, buffers_ptr)
}

wamr_wasi_glGenerateMipmap :: wamr.NativeSymbol {
	"wasi_glGenerateMipmap",
	&GenerateMipmap,
	"(i)",
}

GenerateMipmap :: proc "c" (exec_env: wamr.ExecEnv, target: i32) {
	gl.GenerateMipmap(transmute(u32)target)
}

wamr_wasi_glGenFramebuffers :: wamr.NativeSymbol {
	"wasi_glGenFramebuffers",
	&GenFramebuffers,
	"(iI)",
}

GenFramebuffers :: proc "c" (
	exec_env: wamr.ExecEnv,
	n: i32,
	framebuffers: int,
) {
	framebuffers_rawptr := wamr.bounds_check(
		exec_env,
		framebuffers,
		int(n) * 4,
	) or_return
	framebuffers_ptr := transmute([^]u32)framebuffers_rawptr

	gl.GenFramebuffers(n, framebuffers_ptr)
}

wamr_wasi_glGenRenderbuffers :: wamr.NativeSymbol {
	"wasi_glGenRenderbuffers",
	&GenRenderbuffers,
	"(iI)",
}

GenRenderbuffers :: proc "c" (
	exec_env: wamr.ExecEnv,
	n: i32,
	renderbuffers: int,
) {
	renderbuffers_rawptr := wamr.bounds_check(
		exec_env,
		renderbuffers,
		int(n) * 4,
	) or_return
	renderbuffers_ptr := transmute([^]u32)renderbuffers_rawptr

	gl.GenRenderbuffers(n, renderbuffers_ptr)
}

wamr_wasi_glGenTextures :: wamr.NativeSymbol {
	"wasi_glGenTextures",
	&GenTextures,
	"(iI)",
}

GenTextures :: proc "c" (exec_env: wamr.ExecEnv, n: i32, textures: int) {
	textures_rawptr := wamr.bounds_check(
		exec_env,
		textures,
		int(n) * 4,
	) or_return
	textures_ptr := transmute([^]u32)renderbuffers_rawptr

	gl.GenTextures(n, renderbuffers_ptr)
}

wamr_wasi_glGetActiveAttrib :: wamr.NativeSymbol {
	"wasi_glGetActiveAttrib",
	&GetActiveAttrib,
	"(iiiIIII)",
}

GetActiveAttrib :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, index, bufSize: i32,
	length, size, type, name: i64,
) {
	glProgram, glIndex := transmute(u64)program, transmute(u64)index

	glLength_raw := wamr.bounds_check(exec_env, length, 4) or_return
	glSize_raw := wamr.bounds_check(exec_env, size, 4) or_return
	glType_raw := wamr.bounds_check(exec_env, type, 4) or_return

	glName_raw := wamr.bounds_check(exec_env, name, int(bufSize)) or_return

	glLength := transmute(^i32)glLength_raw
	glSize := transmute(^i32)glSize_raw
	glType := transmute(^u32)glType_raw
	glName := transmute([^]u8)glName_raw

	gl.GetActiveAttrib(
		glProgram,
		glIndex,
		bufSize,
		glLength,
		glSize,
		glType,
		glName,
	)
}

wamr_wasi_glGetAttachedShaders :: wamr.NativeSymbol {
	"wasi_glGetAttachedShaders",
	&GetAttachedShaders,
	"(iiII)",
}

GetAttachedShaders :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, maxCount: i32,
	count, shaders: int,
) {
	count_raw := wamr.bounds_check(exec_env, count, 4) or_return
	shaders_raw := wamr.bounds_check(
		exec_env,
		shaders,
		int(maxCount) * 4,
	) or_return

	gl.GetAttachedShaders(
		transmute(u32)program,
		maxCount,
		transmute([^]i32)count_raw,
		transmute([^]u32)shaders_raw,
	)
}

wamr_wasi_glGetAttribLocation :: wamr.NativeSymbol {
	"wasi_glGetAttribLocation",
	&GetAttribLocation,
	"(i$)i",
}

GetAttribLocation :: proc "c" (
	exec_env: wamr.ExecEnv,
	program: i32,
	name: cstring,
) -> i32 {
	return gl.GetAttribLocation(transmute(u32)program, name)
}

wamr_wasi_glBooleanv :: wamr.NativeSymbol{"wasi_glBooleanv", &Booleanv, "(iI)"}

Booleanv :: proc "c" (exec_env: wamr.ExecEnv, pname: i32, data: int) {
	glPname := transmute(u32)pname
	data_addr := check_glGet(glPname, data) or_return

	gl.Booleanv(glPname, transmute(^bool)data_addr)
}

wamr_wasi_glGetBufferParameteriv :: wamr.NativeSymbol {
	"wasi_glGetBufferParameteriv",
	&GetBufferParameteriv,
	"(iiI)",
}

GetBufferParameteriv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, value: i32,
	data: int,
) {
	return_size := 4
	if target == gl.BUFFER_MAPPED do return_size = 1
	data_addr := wamr.bounds_check(exec_env, data, 4) or_return
	gl.GetBufferParameteriv(
		transmute(u32)target,
		transmute(u32)value,
		transmute([^]u32)data_addr,
	)
}

wamr_wasi_glGetError :: wamr.NativeSymbol{"wasi_glGetError", &GetError, "()i"}

GetError :: proc "c" (exec_env: wamr.ExecEnv) -> i32 {
	err := gl.GetError()
	return transmute(i32)err
}

wamr_wasi_glGetFloatv :: wamr.NativeSymbol {
	"wasi_glGetFloatv",
	&GetFloatv,
	"(iI)",
}

GetFloatv :: proc "c" (exec_env: wamr.ExecEnv, pname: i32, data: i) {
	glPname := transmute(u32)pname
	data_addr := check_glGet(glPname, data) or_return
	gl.GetFloatv(glPname, transmute(^f32)data_addr)
}


/*

GLES 3.0 API begins here

*/


wamr_wasi_glBeginQuery :: wamr.NativeSymbol {
	"wasi_glBeginQuery",
	&BeginQuery,
	"(ii)",
}

BeginQuery :: proc "c" (exec_env: wamr.ExecEnv, target: i32, id: i32) {
	gl.BeginQuery(transmute(u32)target, transmute(u32)id)
}

wamr_wasi_glEndQuery :: wamr.NativeSymbol{"wasi_glEndQuery", &EndQuery, "(ii)"}

EndQuery :: proc "c" (exec_env: wamr.ExecEnv, target: i32) {
	gl.EndQuery(transmute(u32)target)
}


/*

 Utility Functions

*/

arch :: enum {
	.32,
	.64,
}

check_glGet :: proc(
	exec_env: wamr.ExecEnv,
	pname: u32,
	data: int,
	arch := .32,
) -> (
	rawptr,
	ok,
) {
	i := arch == .32 ? 4 : 8 // default value of ints/floats

	size, num := i, 1 // number of bytes to be allocated for data
	switch pname { 	// TODO, we should make sure to check ALL pnames
	case gl.ALIASED_LINE_WIDTH_RANGE,
	     gl.ALIASED_POINT_SIZE_RANGE,
	     gl.DEPTH_RANGE,
	     gl.MAX_VIEWPORT_DIMS:
		size, num = i, 2 // two values
	case gl.BLEND,
	     gl.CULL_FACE,
	     gl.DEPTH_TEST,
	     gl.DEPTH_WRITEMASK,
	     gl.DITHER,
	     gl.SAMPLE_ALPHA_TO_COVERAGE,
	     gl.SAMPLE_COVERAGE,
	     gl.SAMPLE_COVERAGE_INVERT,
	     gl.SCISSOR_TEST,
	     gl.SHADER_COMPILER,
	     gl.TRANSFORM_FEEDBACK_ACTIVE,
	     gl.TRANSFORM_FEEDBACK_PAUSED:
		size, num = 1, 1 // flags/booleans
	case gl.COLOR_WRITEMASK:
		size, num = 1, 4
	case gl.BLEND_COLOR, gl.COLOR_CLEAR_VALUE, gl.SCISSOR_BOX, gl.VIEWPORT:
		size, num = i, 4 // four values
	case gl.COMPRESSED_TEXTURE_FORMATS:
		j: int
		gl.GetInteger64v(gl.NUM_COMPRESSED_TEXTURE_FORMATS, &j)
		size = i, j // many values
	case gl.SHADER_BINARY_FORMATS:
		j: int
		gl.GetInteger64v(gl.NUM_SHADER_BINARY_FORMATS, &j)
		size, num = i, j // many values
	}

	return wamr.bounds_check(exec_env, data, size * num)
}
