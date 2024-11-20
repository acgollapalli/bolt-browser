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
	data_addr := check_glGet(exec_env, glPname, data) or_return

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
	data_addr := check_glGet(exec_env, glPname, data) or_return
	gl.GetFloatv(glPname, transmute(^f32)data_addr)
}

wamr_wasi_glGetFramebufferAttachmentParameteriv :: wamr.NativeSymbol {
	"wasi_glGetFramebufferAttachmentParameteriv",
	&GetFramebufferAttachmentParameteriv,
	"(iiiI)",
}

GetFramebufferAttachmentParameteriv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, attachment, pname: i32,
	params: int,
) {
	params_ptr := wamr.bounds_check(exec_env, params, 4) or_return

	gl.GetFramebufferAttachmentParameteriv(
		transmute(u32)target,
		transmute(u32)attachment,
		transmute(u32)pname,
		transmute(^i32)params_ptr,
	)
}

wamr_wasi_glGetIntegerv :: wamr.NativeSymbol {
	"wasi_glGetIntegerv",
	&GetIntegerv,
	"(iI)",
}

GetIntegerv :: proc "c" (exec_env: wamr.ExecEnv, pname: i32, target: int) {
	glPname := transmute(u32)pname
	target_ptr := check_glGet(exec_env, pname, target) or_return
	gl.GetIntegerv(glPname, target_ptr)
}

wamr_wasi_glGetProgramiv :: wamr.NativeSymbol {
	"wasi_glGetProgramiv",
	&GetProgramiv,
	"(iiI)",
}

GetProgramiv :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, pname: i32,
	params: int,
) {
	params_ptr := wamr.bounds_check(exec_env, params, 4) or_return

	gl.GetProgramiv(
		transmute(u32)program,
		transmute(u32)pname,
		transmute([^]i32)params,
	)
}

wamr_wasi_glGetProgramInfoLog :: wamr.NativeSymbol {
	"wasi_glGetProgramInfoLog",
	&GetProgramInfoLog,
	"(iiII)",
}

GetProgramInfoLog :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, maxLength: i32,
	length, infoLog: int,
) {
	length_ptr := wamr.bounds_check(exec_env, length, 4) or_return
	infoLog_ptr := wamr.bounds_check(exec_env, infolog, maxLength) or_return
	gl.GetProgramInfoLog(
		transmute(u32)program,
		maxLength,
		transmute(^i32)length_ptr,
		transmute([^]u8)infoLog_ptr,
	)
}

wamr_wasi_glGetRenderBufferParameteriv :: wamr.NativeSymbol {
	"wasi_glGetRenderBufferParameteriv",
	&GetRenderBufferParameteriv,
	"(iiI)",
}

GetRenderBufferParameteriv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	params: int,
) {
	params_ptr := wamr.bounds_check(exec_env, params, 4) or_return
	gl.GetRenderBufferParameteriv(
		transmute(u32)target,
		transmute(u32)pname,
		transmute([^]i32)params_ptr,
	)
}

wamr_wasi_glGetShaderiv :: wamr.NativeSymbol {
	"wasi_glGetShaderiv",
	&GetShaderiv,
	"(iiI)",
}

GetShaderiv :: proc "c" (
	exec_env: wamr.ExecEnv,
	shader, pname: i32,
	params: int,
) {
	params_ptr := wamr.bounds_check(exec_env, params, 4) or_return
	gl.GetShaderiv(
		transmute(u32)shader,
		transmute(u32)pname,
		transmute([^]i32)params_ptr,
	)
}

wamr_wasi_glGetShaderInfoLog :: wamr.NativeSymbol {
	"wasi_glGetShaderInfoLog",
	&GetShaderInfoLog,
	"(iiII)",
}

GetShaderInfoLog :: proc "c" (
	exec_env: wamr.ExecEnv,
	shader, maxLength: i32,
	length, infoLog: int,
) {
	length_ptr := wamr.bounds_check(exec_env, length, 4) or_return
	infoLog_ptr := wamr.bounds_check(exec_env, infolog, maxLength) or_return
	gl.GetShaderInfoLog(
		transmute(u32)shader,
		maxLength,
		transmute(^u32)length_ptr,
		transmute([^]u8)infoLog_ptr,
	)
}

wamr_wasi_glGetShaderPrecisionFormat :: wamr.NativeSymbol {
	"wasi_glGetShaderPrecisionFormat",
	&GetShaderPrecisionFormat,
	"(iiII)",
}

GetShaderPrecisionFormat :: proc "c" (
	exec_env: wamr.ExecEnv,
	shaderType, precisionType: i32,
	range, precision: int,
) {
	range_ptr := wamr.bounds_check(exec_env, range, 8) or_return
	precision_ptr := wamr.bounds_check(exec_env, precision, 4) or_return
	gl.GetShaderPrecisionFormat(
		transmute(u32)shaderType,
		transmute(u32)precisionType,
		transmute([^]i32)range,
		transmute(^i32)precision,
	)
}

wamr_wasi_glGetShaderSource :: wamr.NativeSymbol {
	"wasi_glGetShaderSource",
	&GetShaderSource,
	"(iiII)",
}

GetShaderSource :: proc "c" (
	exec_env: wamr.ExecEnv,
	shader, bufSize: i32,
	length, source: int,
) {
	length_ptr := wamr.bounds_check(exec_env, length, 4) or_return
	source_ptr := wamr.bounds_check(exec_env, source, bufSize) or_return
	gl.GetShaderSource(
		transmute(u32)shader,
		bufSize,
		transmute(^i32)length,
		transmute([^]u8)source,
	)
}

wamr_wasi_glGetString :: wamr.NativeSymbol {
	"wasi_glGetString",
	&GetString,
	"(i)$",
}

GetString :: proc "c" (exec_env: wamr.ExecEnv, name: i32) -> cstring {
	return gl.GetString(transmute(u32)name)
}

wamr_wasi_glGetTexParameterfv :: wamr.NativeSymbol {
	"wasi_glGetTexParameterfv",
	&GetTexParameterfv,
	"(iiI)",
}

GetTexParameterfv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	params: int,
) {
	glPname := transmute(u32)pname
	size := 4
	if glPname == gl.TEXTURE_IMMUTABLE_FORMAT do size = 1

	params_ptr := wamr.bounds_check(exec_env, params, size) or_return
	gl.GetTexParameterfv(
		transmute(u32)target,
		transmute(u32)pname,
		transmute([^]f32)params_ptr,
	)
}

wamr_wasi_glGetTexParameterfv :: wamr.NativeSymbol {
	"wasi_glGetTexParameterfv",
	&GetTexParameterfv,
	"(iiI)",
}

GetTexParameteriv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	params: int,
) {
	glPname := transmute(u32)pname
	size := 4
	if glPname == gl.TEXTURE_IMMUTABLE_FORMAT do size = 1

	params_ptr := wamr.bounds_check(exec_env, params, size) or_return
	gl.GetTexParameteriv(
		transmute(u32)target,
		transmute(u32)pname,
		transmute([^]i32)params_ptr,
	)
}

wamr_wasi_glGetUniformfv :: wamr.NativeSymbol {
	"wasi_glGetUniformfv",
	&GetUniformfv,
	"(iiI)",
}

GetUniformfv :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, location: i32,
	params: int,
) {
	// params can have anywhere from 1 to four values returned
	// and we have no way of konwing what the actual type of the param is
	// so we basically have to say that the MAXIMUM number of values that can be returned
	// by OpenGL must be contained within the WASM modules address space
	params_ptr := wamr.bounds_check(exec_env, params, 16) or_return
	gl.GetUniformfv(transmute(u32)program, location, transmute([^]f32)params_ptr)
}

wamr_wasi_glGetUniformfv :: wamr.NativeSymbol {
	"wasi_glGetUniformfv",
	&GetUniformfv,
	"(iiI)",
}

GetUniformiv :: proc "c" (
	exec_env: wamr.ExecEnv,
	program, location: i32,
	params: int,
) {
	// params can have anywhere from 1 to four values returned
	// and we have no way of knowing what the actual type of the param is
	// so we basically have to say that the MAXIMUM number of values that can be returned
	// by OpenGL must be contained within the WASM modules address space
	params_ptr := wamr.bounds_check(exec_env, params, 16) or_return
	gl.GetUniformiv(transmute(u32)program, location, transmute([^]i32)params_ptr)
}

wamr_wasi_glGetUniformLocation :: wamr.NativeSymbol {
	"wasi_glGetUniformLocation",
	&GetUniformLocation,
	"(i$)",
}

GetUniformLocation :: proc "c" (
	exec_env: wamr.ExecEnv,
	program: i32,
	name: cstring,
) {
	gl.GetUniformLocation(transmute(u32)program, name)
}

wamr_wasi_glGetVertexAttribfv :: wamr.NativeSymbol {
	"wasi_glGetVertexAttribfv",
	&GetVertexAttribfv,
	"(iiI)",
}

GetVertexAttribfv :: proc "c" (
	exec_env: wamr.ExecEnv,
	index, pname: i32,
	params: int,
) {
	glPname := transmute(u32)pname
	size := pname == gl.CURRENT_VERTEX_ATTRIB ? 16 : 4

	params_ptr := wamr.bounds_check(exec_env, params, size) or_return
	gl.GetVertexAttribfv(
		transmute(u32)index,
		glPname,
		transmute([^]f32)params_ptr,
	)
}

wamr_wasi_glGetVertexAttribiv :: wamr.NativeSymbol {
	"wasi_glGetVertexAttribiv",
	&GetVertexAttribiv,
	"(iiI)",
}

GetVertexAttribiv :: proc "c" (
	exec_env: wamr.ExecEnv,
	index, pname: i32,
	params: int,
) {
	glPname := transmute(u32)pname
	size := pname == gl.CURRENT_VERTEX_ATTRIB ? 16 : 4

	params_ptr := wamr.bounds_check(exec_env, params, size) or_return
	gl.GetVertexAttribiv(
		transmute(u32)index,
		glPname,
		transmute([^]i32)params_ptr,
	)
}

wamr_wasi_glGetVertexAttribPointerv :: wamr.NativeSymbol {
	"wasi_glGetVertexAttribPointerv",
	&GetVertexAttribPointerv,
	"(iiI)",
}

GetVertexAttribPointerv :: proc "c" (
	exec_env: wamr.ExecEnv,
	index, pname: i32,
	pointer: int,
) {
	pointer_ptr := wamr.bounds_check(exec_env, pointer, 8) or_return
	gl.GetVertexAttribPointerv(
		transmute(u32)index,
		transmute(u32)pname,
		transmute(^uintptr)pointer_ptr,
	)
}

wamr_wasi_glHint :: wamr.NativeSymbol{"wasi_glHint", &Hint, "(ii)"}

Hint :: proc "c" (exec_env: wamr.ExecEnv, target, mode: i32) {
	gl.Hint(transmute(u32)target, transmute(u32)hint)
}

wamr_wasi_glIsBuffer :: wamr.NativeSymbol{"wasi_glIsBuffer", &IsBuffer, "(i)i"}

IsBuffer :: proc "c" (exec_env: wamr.ExecEnv, buffer: i32) -> i32 {
	b := gl.IsBuffer(transmute(u32)buffer)
	return i32(transmute(u8)b)
}

wamr_wasi_glIsEnabled :: wamr.NativeSymbol {
	"wasi_glIsEnabled",
	&IsEnabled,
	"(i)i",
}

IsEnabled :: proc "c" (exec_env: wamr.ExecEnv, cap: i32) -> i32 {
	b := gl.IsEnabled(transmute(u32)cap)
	return i32(transmute(u8)b)
}

wamr_wasi_glIsFramebufffer :: wamr.NativeSymbol {
	"wasi_glIsFramebufffer",
	&IsFramebufffer,
	"(i)i",
}

IsFramebufffer :: proc "c" (exec_env: wamr.ExecEnv, framebuffer: i32) -> i32 {
	b := gl.IsFramebufffer(transmute(u32)framebuffer)
	return i32(transmute(u8)b)
}

wamr_wasi_glIsProgram :: wamr.NativeSymbol {
	"wasi_glIsProgram",
	&IsProgram,
	"(i)i",
}

IsProgram :: proc "c" (exec_env: wamr.ExecEnv, program: i32) -> i32 {
	b := gl.IsProgram(transmute(u32)program)
	return i32(transmute(u8)b)
}

wamr_wasi_glRenderbuffer :: wamr.NativeSymbol {
	"wasi_glRenderbuffer",
	&Renderbuffer,
	"(i)i",
}

Renderbuffer :: proc "c" (exec_env: wamr.ExecEnv, renderbuffer: i32) {
	b := gl.Renderbuffer(transmute(u32)renderbuffer)
	return i32(transmute(u8)b)
}

wamr_wasi_glIsShader :: wamr.NativeSymbol{"wasi_glIsShader", &IsShader, "(i)i"}

IsShader :: proc "c" (exec_env: wamr.ExecEnv, shader: i32) {
	b := gl.IsShader(transmute(u32)shader)
	return i32(transmute(u8)b)
}

wamr_wasi_glIsTexture :: wamr.NativeSymbol {
	"wasi_glIsTexture",
	&IsTexture,
	"(i)i",
}

IsTexture :: proc "c" (exec_env: wamr.ExecEnv, texture: i32) {
	b := gl.IsTexture(transmute(u32)texture)
	return i32(transmute(u8)b)
}

wamr_wasi_glLineWidth :: wamr.NativeSymbol {
	"wasi_glLineWidth",
	&LineWidth,
	"(f)",
}

LineWidth :: proc "c" (exec_env: wamr.ExecEnv, width: f32) {
	gl.LineWidth(width)
}

wamr_wasi_glLinkProgram :: wamr.NativeSymbol {
	"wasi_glLinkProgram",
	&LinkProgram,
	"(i)",
}

LinkProgram :: proc "c" (exec_env: wamr.ExecEnv, program: i32) {
	gl.LinkProgram(transmute(u32)program)
}

wamr_wasi_glPixelStorei :: wamr.NativeSymbol {
	"wasi_glPixelStorei",
	&PixelStorei,
	"(ii)",
}

PixelStorei :: proc "c" (exec_env: wamr.ExecEnv, pname, param: i32) {
	gl.PixelStorei(transmute(u32)pname, param)
}

wamr_wasi_glPolygonOffset :: wamr.NativeSymbol {
	"wasi_glPolygonOffset",
	&PolygonOffset,
	"(ff)",
}

PolygonOffset :: proc "c" (exec_env: wamr.ExecEnv, factor, units: f32) {
	gl.PolygonOffset(factor, units)
}

wamr_wasi_glReadPixels :: wamr.NativeSymbol {
	"wasi_glReadPixels",
	&ReadPixels,
	"(iiiiiiI)",
}

ReadPixels :: proc "c" (
	exec_env: wamr.ExecEnv,
	x, y, width, height, format, type: i32,
	data: int,
) {
	data_ptr := check_pixel_storage_space(
		exec_env,
		width,
		height,
		format,
		type,
		data,
	) or_return

	gl.ReadPixels(
		x,
		y,
		width,
		height,
		transmute(u32)format,
		transmute(u32)type,
		data_ptr,
	)
}

wamr_wasi_glReleaseShaderCompiler :: wamr.NativeSymbol {
	"wasi_glReleaseShaderCompiler",
	&ReleaseShaderCompiler,
	"()",
}

ReleaseShaderCompiler :: proc "c" (exec_env: wamr.ExecEnv) {
	gl.ReleaseShaderCompiler()
}

wamr_wasi_glRenderbufferStorage :: wamr.NativeSymbol {
	"wasi_glRenderbufferStorage",
	&RenderbufferStorage,
	"(iiii)",
}

RenderbufferStorage :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, internalformat, width, height: i32,
) {
	gl.RenderbufferStorage(
		transmute(u32)target,
		transmute(u32)internalformat,
		width,
		height,
	)
}

wamr_wasi_glSampleCoverage :: wamr.NativeSymbol {
	"wasi_glSampleCoverage",
	&SampleCoverage,
	"(fi)",
}

// FIXME: if we use 64 bit version, are the 64 bit register values just being
// truncated by the software?
// TODO: write reflection util to convert things into the values we want
// automatically, preferably at compile time
SampleCoverage :: proc "c" (exec_env: wamr.ExecEnv, value: f32, invert: i32) {
	gl.SampleCoverage(value, bool(invert))
}


wamr_wasi_glScissor :: wamr.NativeSymbol{"wasi_glScissor", &Scissor, "(iiii)"}

Scissor :: proc "c" (exec_env: wamr.ExecEnv, x, y, width, height: i32) {
	gl.Scissor(x, y, width, height)
}

wamr_wasi_glShaderBinary :: wamr.NativeSymbol {
	"wasi_glShaderBinary",
	&ShaderBinary,
	"(iIiIi)",
}

ShaderBinary :: proc "c" (
	exec_env: wamr.ExecEnv,
	count: i32,
	shaders: int,
	binaryFormat: i32,
	binary: int,
	length: i32,
) {

	shaders_ptr := wamr.bounds_check(exec_env, shaders, 4 * count) or_return
	binary_ptr := wamr.bounds_check(exec_env, binary, length) or_return

	gl.ShaderBinary(
		count,
		transmute(^u32)shaders_ptr,
		transmute(u32)binaryFormat,
		binary_ptr,
		length,
	)
}

wamr_wasi_glShaderSource :: wamr.NativeSymbol {
	"wasi_glShaderSource",
	&ShaderSource,
	"(iiII)",
}

ShaderSource :: proc "c" (
	exec_env: wamr.ExecEnv,
	shader, count: i32,
	string, length: int,
) {
	length_ptr := wamr.bounds_check(exec_env, length, count * 4) or_return
	length_arr := transmute([^]i32)length_ptr

	offset := 0
	for i := 0; i < count; i += 1 do offset += length_arr[i]

	string_ptr := wamr.bounds_check(exec_env, string, offset) or_return

	string_arr := transmute([^]cstring)string_ptr
	gl.ShaderSource(transmute(u32)shader, count, string_arr, length_arr)
}

wamr_wasi_glStencilFunc :: wamr.NativeSymbol {
	"wasi_glStencilFunc",
	&StencilFunc,
	"(iii)",
}

StencilFunc :: proc "c" (exec_env: wamr.ExecEnv, func, ref, mask: i32) {
	gl.StencilFunc(transmute(u32)func, ref, transmute(u32)mask)
}

wamr_wasi_glStencileFuncSeparate :: wamr.NativeSymbol {
	"wasi_glStencileFuncSeparate",
	&StencileFuncSeparate,
	"(iiii)",
}

StencileFuncSeparate :: proc "c" (
	exec_env: wamr.ExecEnv,
	face, func, ref, mask: i32,
) {
	gl.StencileFuncSeparate(
		transmute(u32)face,
		transmute(u32)func,
		ref,
		transmute(u32)mask,
	)
}

wamr_wasi_glStencilMask :: wamr.NativeSymbol {
	"wasi_glStencilMask",
	&StencilMask,
	"(i)",
}

StencilMask :: proc "c" (exec_env: wamr.ExecEnv, mask: i32) {
	gl.StencilMask(transmute(u32)mask)
}

wamr_wasi_glStencilMaskSeparate :: wamr.NativeSymbol {
	"wasi_glStencilMaskSeparate",
	&StencilMaskSeparate,
	"(ii)",
}

StencilMaskSeparate :: proc "c" (exec_env: wamr.ExecEnv, face, mask: i32) {
	gl.StencilMaskSeparate(transmute(u32)face, transmute(u32)mask)
}

wamr_wasi_glStencilOp :: wamr.NativeSymbol {
	"wasi_glStencilOp",
	&StencilOp,
	"(iii)",
}

StencilOp :: proc "c" (exec_env: wamr.ExecEnv, sfail, dpfail, dppass: i32) {
	gl.StencilOp(transmute(u32)sfail, transmute(u32)dpfail, transmute(u32)dppass)
}

wamr_wasi_glStencilOpSeparate :: wamr.NativeSymbol {
	"wasi_glStencilOpSeparate",
	&StencilOpSeparate,
	"(iiii)",
}

StencilOpSeparate :: proc "c" (
	exec_env: wamr.ExecEnv,
	face, sfail, dpfail, dppass: i32,
) {
	gl.StencilOpSeparate(
		transmute(u32)face,
		transmute(u32)sfail,
		transmute(u32)dpfail,
		transmute(u32)dppass,
	)
}

wamr_wasi_glTexImage2D :: wamr.NativeSymbol {
	"wasi_glTexImage2D",
	&TexImage2D,
	"(iiiiiiiiI)",
}

TexImage2D :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, internalFormat, width, height, border, format, type: i32,
	data: int,
) {
	data_ptr := check_pixel_storage_space(
		exec_env,
		width,
		height,
		format,
		type,
		data,
	) or_return

	gl.TexImage2D(
		transmute(u32)target,
		level,
		internalFormat,
		width,
		height,
		border,
		transmute(u32)format,
		transmute(u32)type,
		data_ptr,
	)
}

wamr_wasi_glTexParameterf :: wamr.NativeSymbol {
	"wasi_glTexParameterf",
	&TexParameterf,
	"(iif)",
}

TexParameterf :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	param: f32,
) {
	gl.TexParameterf(transmute(u32)target, transmute(u32)pname, param)
}

wamr_wasi_glTexParameterfv :: wamr.NativeSymbol {
	"wasi_glTexParameterfv",
	&TexParameterfv,
	"(iiI)",
}

TexParameterfv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	params: int,
) {
	if transmute(u32)pname == gl.TEXTURE_BORDER_COLOR ||
	   transmute(u32)pname == gl.TEXTURE_SWIZZLE_RGBA {
		return
	} else {
		param_ptr := wamr.bounds_check(exec_env, params, 4) or_return
		gl.TexParameterfv(
			transmute(u32)target,
			transmute(u32)pname,
			transmute([^]f32)param,
		)
	}
}

wamr_wasi_glTexParameterf :: wamr.NativeSymbol {
	"wasi_glTexParameterf",
	&TexParameterf,
	"(iii)",
}

TexParameteif :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	param: i32,
) {
	gl.TexParameteif(transmute(u32)target, transmute(u32)pname, param)
}

wamr_wasi_glTexParameteifv :: wamr.NativeSymbol {
	"wasi_glTexParameteifv",
	&TexParameteifv,
	"(iiI)",
}

TexParameteifv :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, pname: i32,
	params: int,
) {
	if transmute(u32)pname == gl.TEXTURE_BORDER_COLOR ||
	   transmute(u32)pname == gl.TEXTURE_SWIZZLE_RGBA {
		return
	} else {
		param_ptr := wamr.bounds_check(exec_env, params, 4) or_return
		gl.TexParameteifv(
			transmute(u32)target,
			transmute(u32)pname,
			transmute([^]i32)param,
		)
	}
}

wamr_wasi_glTexSubImage2D :: wamr.NativeSymbol {
	"wasi_glTexSubImage2D",
	&TexSubImage2D,
	"(iiiiiiiiI)",
}

TexSubImage2D :: proc "c" (
	exec_env: wamr.ExecEnv,
	target, level, xoffset, yoffset, width, height, format, type: i32,
	data: int,
) {

	data_ptr := check_pixel_storage_space(
		exec_env,
		width,
		height,
		format,
		type,
		data,
	) or_return


	gl.TexSubImage2D(
		transmute(u32)target,
		level,
		xoffset,
		yoffset,
		width,
		height,
		transmute(u32)format,
		transmute(u32)type,
		data_ptr,
	)
}

wamr_wasi_glUniform1f :: wamr.NativeSymbol {
	"wasi_glUniform1f",
	&Uniform1f,
	"(if)",
}

Uniform1f :: proc "c" (exec_env: wamr.ExecEnv, location: i32, v0: f32) {
	gl.Uniform1f(location, v0)
}

wamr_wasi_glUniform1fv :: wamr.NativeSymbol {
	"wasi_glUniform1fv",
	&Uniform1fv,
	"(iiI)",
}

Uniform1fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform1fv(location, count, transmute([^]f32)value_ptr)
}

wamr_wasi_glUniform1i :: wamr.NativeSymbol {
	"wasi_glUniform1i",
	&Uniform1i,
	"(ii)",
}

Uniform1i :: proc "c" (exec_env: wamr.ExecEnv, location: i32, v0: i32) {
	gl.Uniform1i(location, v0)
}

wamr_wasi_glUniform1iv :: wamr.NativeSymbol {
	"wasi_glUniform1iv",
	&Uniform1iv,
	"(iiI)",
}

Uniform1iv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform1iv(location, count, transmute([^]i32)value_ptr)
}

wamr_wasi_glUniform2f :: wamr.NativeSymbol {
	"wasi_glUniform2f",
	&Uniform2f,
	"(iff)",
}

Uniform2f :: proc "c" (exec_env: wamr.ExecEnv, location: i32, v0, v1: f32) {
	gl.Uniform2f(location, v0, v1)
}

wamr_wasi_glUniform2fv :: wamr.NativeSymbol {
	"wasi_glUniform2fv",
	&Uniform2fv,
	"(iiI)",
}

Uniform2fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform2fv(location, count, transmute([^]f32)value_ptr)
}

wamr_wasi_glUniform2i :: wamr.NativeSymbol {
	"wasi_glUniform2i",
	&Uniform2i,
	"(iii)",
}

Uniform2i :: proc "c" (exec_env: wamr.ExecEnv, location: i32, v0, v1: i32) {
	gl.Uniform2i(location, v0, v1)
}

wamr_wasi_glUniform2iv :: wamr.NativeSymbol {
	"wasi_glUniform2iv",
	&Uniform2iv,
	"(iiI)",
}

Uniform2iv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform2iv(location, count, transmute([^]i32)value_ptr)
}

wamr_wasi_glUniform3f :: wamr.NativeSymbol {
	"wasi_glUniform3f",
	&Uniform3f,
	"(ifff)",
}

Uniform3f :: proc "c" (
	exec_env: wamr.ExecEnv,
	location: i32,
	v0, v1, v2: f32,
) {
	gl.Uniform3f(location, v0, v1, v2)
}

wamr_wasi_glUniform3fv :: wamr.NativeSymbol {
	"wasi_glUniform3fv",
	&Uniform3fv,
	"(iiI)",
}

Uniform3fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform3fv(location, count, transmute([^]f32)value_ptr)
}

wamr_wasi_glUniform3i :: wamr.NativeSymbol {
	"wasi_glUniform3i",
	&Uniform3i,
	"(iiii)",
}

Uniform3i :: proc "c" (
	exec_env: wamr.ExecEnv,
	location: i32,
	v0, v1, v2: i32,
) {
	gl.Uniform3i(location, v0, v1, v2)
}

wamr_wasi_glUniform3iv :: wamr.NativeSymbol {
	"wasi_glUniform3iv",
	&Uniform3iv,
	"(iiI)",
}

Uniform3iv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform3iv(location, count, transmute([^]i32)value_ptr)
}

wamr_wasi_glUniform4f :: wamr.NativeSymbol {
	"wasi_glUniform4f",
	&Uniform4f,
	"(iffff)",
}

Uniform4f :: proc "c" (
	exec_env: wamr.ExecEnv,
	location: i32,
	v0, v1, v2, v3: f32,
) {
	gl.Uniform4f(location, v0, v1, v2, v3)
}

wamr_wasi_glUniform4fv :: wamr.NativeSymbol {
	"wasi_glUniform4fv",
	&Uniform4fv,
	"(iiI)",
}

Uniform4fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform4fv(location, count, transmute([^]f32)value_ptr)
}

wamr_wasi_glUniform4i :: wamr.NativeSymbol {
	"wasi_glUniform4i",
	&Uniform4i,
	"(iiiii)",
}

Uniform4i :: proc "c" (
	exec_env: wamr.ExecEnv,
	location: i32,
	v0, v1, v2, v3: i32,
) {
	gl.Uniform4i(location, v0, v1, v2, v3)
}

wamr_wasi_glUniform4iv :: wamr.NativeSymbol {
	"wasi_glUniform4iv",
	&Uniform4iv,
	"(iiI)",
}

Uniform4iv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4) or_return
	gl.Uniform4iv(location, count, transmute([^]i32)value_ptr)
}

wamr_wasi_glUniformMatrix2fv :: wamr.NativeSymbol {
	"wasi_glUniformMatrix2fv",
	&UniformMatrix2fv,
	"(iiiI)",
}

UniformMatrix2fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count, transpose: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4 * 4) or_return
	gl.UniformMatrix2fv(location, count, bool(transpose), value_ptr)
}

wamr_wasi_glUniformMatrix3fv :: wamr.NativeSymbol {
	"wasi_glUniformMatrix3fv",
	&UniformMatrix3fv,
	"(iiiI)",
}

UniformMatrix3fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count, transpose: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4 * 9) or_return
	gl.UniformMatrix3fv(location, count, bool(transpose), value_ptr)
}

wamr_wasi_glUniformMatrix4fv :: wamr.NativeSymbol {
	"wasi_glUniformMatrix4fv",
	&UniformMatrix4fv,
	"(iiiI)",
}

UniformMatrix4fv :: proc "c" (
	exec_env: wamr.ExecEnv,
	location, count, transpose: i32,
	value: int,
) {
	value_ptr := wamr.bounds_check(exec_env, value, count * 4 * 16) or_return
	gl.UniformMatrix4fv(location, count, bool(transpose), value_ptr)
}

wamr_wasi_glUseProgram :: wamr.NativeSymbol {
	"wasi_glUseProgram",
	&UseProgram,
	"(i)",
}

UseProgram :: proc "c" (exec_env: wamr.ExecEnv, program: i32) {
	gl.UseProgram(transmute(u32)program)
}


wamr_wasi_glValidateProgram :: wamr.NativeSymbol {
	"wasi_glValidateProgram",
	&ValidateProgram,
	"(i)",
}

ValidateProgram :: proc "c" (exec_env: wamr.ExecEnv, program: i3) {
	gl.ValidateProgram(transmute(u32)program)
}

wamr_wasi_glVertexAttrib1f :: wamr.NativeSymbol {
	"wasi_glVertexAttrib1f",
	&VertexAttrib1f,
	"(if)",
}

VertexAttrib1f :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v0: f32) {
	gl.VertexAttrib1f(transmute(u32)index, v0)
}

wamr_wasi_glVertexAttrib2f :: wamr.NativeSymbol {
	"wasi_glVertexAttrib2f",
	&VertexAttrib2f,
	"(iff)",
}

VertexAttrib2f :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v0, v1: f32) {
	gl.VertexAttrib2f(transmute(u32)index, v0, v1)
}

wamr_wasi_glVertexAttrib3f :: wamr.NativeSymbol {
	"wasi_glVertexAttrib3f",
	&VertexAttrib3f,
	"(ifff)",
}

VertexAttrib3f :: proc "c" (
	exec_env: wamr.ExecEnv,
	index: i32,
	v0, v1, v2: f32,
) {
	gl.VertexAttrib3f(transmute(u32)index, v0, v1, v2)
}

wamr_wasi_glVertexAttrib4f :: wamr.NativeSymbol {
	"wasi_glVertexAttrib4f",
	&VertexAttrib4f,
	"(iffff)",
}

VertexAttrib4f :: proc "c" (
	exec_env: wamr.ExecEnv,
	index: i32,
	v0, v1, v2, v3: f32,
) {
	gl.VertexAttrib4f(transmute(u32)index, v0, v1, v2, v3)
}

wamr_wasi_glVertexAttrib1fv :: wamr.NativeSymbol {
	"wasi_glVertexAttrib1fv",
	&VertexAttrib1fv,
	"(iI)",
}

VertexAttrib1fv :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v: int) {
	v_ptr := wamr.bounds_check(exec_env, v, 4) or_return
	gl.VertexAttrib1fv(index, v_ptr)
}

wamr_wasi_glVertexAttrib2fv :: wamr.NativeSymbol {
	"wasi_glVertexAttrib2fv",
	&VertexAttrib2fv,
	"(iI)",
}

VertexAttrib2fv :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v: int) {
	v_ptr := wamr.bounds_check(exec_env, v, 8) or_return
	gl.VertexAttrib2fv(index, v_ptr)
}

wamr_wasi_glVertexAttrib3fv :: wamr.NativeSymbol {
	"wasi_glVertexAttrib3fv",
	&VertexAttrib3fv,
	"(iI)",
}

VertexAttrib3fv :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v: int) {
	v_ptr := wamr.bounds_check(exec_env, v, 12) or_return
	gl.VertexAttrib3fv(index, v_ptr)
}

wamr_wasi_glVertexAttrib4fv :: wamr.NativeSymbol {
	"wasi_glVertexAttrib4fv",
	&VertexAttrib4fv,
	"(iI)",
}

VertexAttrib4fv :: proc "c" (exec_env: wamr.ExecEnv, index: i32, v: int) {
	v_ptr := wamr.bounds_check(exec_env, v, 16) or_return
	gl.VertexAttrib4fv(index, v_ptr)
}

wamr_wasi_glVertexAttribPointer :: wamr.NativeSymbol {
	"wasi_glVertexAttribPointer",
	&SomeFn,
	"(iiiiiI)",
}

VertexAttribPointer :: proc "c" (
	exec_env: wamr.ExecEnv,
	index, size, normalized, stride: i32,
	pointer: int,
) {
	pointer_val: uintptr
	buffer_bound: bool
	gl.GetBooleanv(gl.ARRAY_BUFFER_BINDING, &buffer_bound)
	if !buffer_bound {
		pointer_val = wamr.bounds_check(exec_env, pointer, size * 4) or_return
	} else {
		// THIS is the happy path
		// FIXME: find everywhere in this file that isn't explicitly a load and make sure
		// that we're checking that we're on the happy path before we do a bounds check
		pointer_val = uintptr(transmute(u64)pointer)

		gl.VertexAttribPointer(
			transmute(u32)index,
			size,
			transmute(u32)type,
			bool(normalized),
			stride,
			pointer_val,
		)
	}
}

wamr_wasi_glViewport :: wamr.NativeSymbol {
	"wasi_glViewport",
	&Viewport,
	"(iiii)",
}

Viewport :: proc "c" (exec_env: wamr.ExecEnv, x, y, width, height: i32) {
	gl.Viewport(x, y, width, height)
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

// How much storage we need to store pixels in memory is highly
// dependent on how the guest application has specified that pixels
//from the frame buffer or from tetures be returned to client memory.
// That means the host application has to deal with that logic.
check_pixel_storage_space :: proc(
	exec_env: wamr.ExecEnv,
	width, height, format: i32,
	type: u32,
	data: int,
) -> (
	rawptr,
	bool,
) {

	buffer_bound: bool
	gl.GetBooleanv(gl.PIXEL_UNPACK_BUFFER, &buffer_bound)
	if buffer_bound {
		return wamr.runtime_addr_app_to_native(module, transmute(u64)data), true
	}

	// let's get our variables
	// we're using the formulat described in
	//   https://registry.khronos.org/OpenGL-Refpages/es3.0/html/glPixelStorei.xhtml
	pack_row_length, pack_row_alignment, num_components: i32
	is_int: false
	gl.getIntegerv(gl.PACK_ROW_LENGTH, pack_row_length)
	gl.getIntegerv(gl.PACK_ROW_ALIGNMENT, pack_row_alignment)

	// if pack_row_length == 0, then a row is stored in memory
	// as the width of the image
	if (pack_row_length == 0) do pack_row_length = width

	// The number of components is defined by the type specified
	// in the read function
	// It's also helpful to know whether it's an int or something that
	// can be controlled by type.
	switch format {
	case gl.RED:
		num_components = 1
	case gl.RED_INTEGER:
		num_components = 1
		is_int = true
	case gl.RG:
		num_components = 2
	case gl.RG_INTEGER:
		num_components = 2
		is_int = true
	case gl.RGB:
		num_components = 3
	case gl.RGB_INTEGER:
		num_components = 3
		is_int = true
	case gl.RGBA:
		num_components = 4
	case gl.RGBA_INTEGER:
		num_components = 4
		is_int = true
	case gl.DEPTH_COMPONENT:
		num_components = 1
	case gl.DEPTH_STENCIL:
		num_components = 2
	case GL_LUMINANCE:
		num_components = 1
	case GL_LUMINANCE_ALPHA:
		num_components = 2
	case GL_ALPHA:
		num_components = 1
	case:
		// guest called with function that is badly formed, w/ wrong value,
		// so we  silently fail.
		// FIXME: Figure out how to send exceptions to wasm client
		return nil, false
	}

	// And now we need to know how big each component of each
	// pixel is. 
	// game programmers would just just set the initial values
	// based on what the values for their textures are and probably
	// not think about it, but we, being the host runtime, need to
	// check it every time for bounds checking
	component_size: 4
	if !is_int {
		switch type {
		case gl.UNSIGNED_BYTE, gl.BYTE:
			component_size = 1
		case gl.HALF_FLOAT:
			component_size = 2
		case gl.FLOAT:
			component_size = 4
		case gl.UNSIGNED_SHORT_5_6_5:
			if num_components != 3 do return nil, false
			component_size = 2
			num_components = 1
		case UNSIGNED_SHORT_4_4_4_4, UNSIGNED_SHORT_5_5_5_1:
			if num_components != 4 do return nil, false
			component_size = 4
			num_components = 1
		case gl.UNSIGNED_INT_2_10_10_10_REV,
		     gl.UNSIGNED_INT_10F_11F_11F_REV,
		     UNSIGNED_INT_5_9_9_9_REV:
			if num_components != 4 do return nil, false
			component_size = 4
			num_components = 1
		}
	}

	// now real quick, let's just get how much space we need for each row
	row_size := pack_row_length * component_size * num_components
	row_size = ceiling(row_size, pack_row_alignment) * pack_row_alignment

	// and now how many rows we need, along with a remainder
	num_full_rows := width * height / pack_row_length
	remainder_pixels := width * height % pack_row_length

	// and now we calculate how mauch space we need for rows + remainder
	required_size := row_size * num_full_rows
	required_size += remainder_pixels * num_components * component_size

	// ... and now we can FINALLY bounds check
	return wamr.bounds_check(exec_env, data, required_size)
}
