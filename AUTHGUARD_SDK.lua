local lua_print = print
local lua_error = error
local lua_setmetatable = setmetatable
local lua_rawset = rawset
local lua_rawget = rawget
local lua_pairs = pairs
local lua_newproxy = newproxy
local lua_getmetatable = getmetatable
local lua_typeof = typeof
local lua_assert = assert
local lua_tostring = tostring

local bit32_lib = bit32
local bit_xor = bit32_lib.bxor
local bit_rrotate = bit32_lib.rrotate
local bit_band = bit32_lib.band
local bit_bor = bit32_lib.bor
local bit_lshift = bit32_lib.lshift
local bit_rshift = bit32_lib.rshift
local bit_lrotate = bit32_lib.lrotate

local os_clock = os.clock
local os_time = os.time
local string_format = string.format
local string_sub = string.sub
local string_pack = string.pack

local buffer_copy = buffer.copy
local buffer_fill = buffer.fill
local buffer_create = buffer.create
local buffer_fromstring = buffer.fromstring
local buffer_len = buffer.len
local buffer_readu8 = buffer.readu8
local buffer_readu16 = buffer.readu16
local buffer_readu32 = buffer.readu32
local buffer_tostring = buffer.tostring
local buffer_writestring = buffer.writestring
local buffer_writeu8 = buffer.writeu8
local buffer_writeu16 = buffer.writeu16
local buffer_writeu32 = buffer.writeu32

local math_floor = math.floor
local math_random = math.random

local global_environment = getfenv()

local runtime_identifier = _VERSION:find("Lune") and "Lune" or "Luau"

local http_request = request

local get_hardware_id = runtime_identifier == "Lune" and function()
    return "spxnso"
end or gethwid or function()
    return string.gsub(game:GetService("RbxAnalyticsService"):GetClientId(), "-", "")
end

local start_time_clock = os_clock()

local function handle_crash_error(error_code)
    lua_print("[" .. error_code .. "]: Crashed")
    writefile("crash.log", "[" .. error_code .. "]: Crashed")
end

local crash_error_code_0 = function()
    handle_crash_error(0)
    while true do end
end

local crash_error_code_16 = function()
    handle_crash_error(16)
    while true do end
end

local conditional_print = function(...)
    if not crash_error_code_16 then
        lua_print(...)
    end
end

local function generate_junk_data(data_type)
    if data_type == "table" then
        local junk_table = {}
        local random_count = math_random(2, 10)

        if random_count < 2 or random_count > 10 then
            handle_crash_error(1)
            while true do end
        end

        for i = 1, math_random(2, 10) do
            junk_table[tostring({}) .. math_random(1000000, 2000000)] = 
                tostring({}) .. math_random(1000000, 2000000)
        end

        return junk_table
    end

    return generate_junk_data("table")
end

local function check_setfenv_fail(func)
    return not pcall(function()
        setfenv(func, getfenv(func))
    end)
end

local function check_stack_overflow(func)
    for i = 1, 198 do
        func = coroutine.wrap(func)
    end

    local success, result = pcall(func)
    if not success and string.find(result, "C stack overflow") then
        return true
    end

    return false
end

local function obfuscated_rotation_func(input_value)
    local rotation_counter = 0

    local identity_wrapper_func = function(input_func)
        return function(value)
            return value
        end
    end

    return (function(value)
        rotation_counter = rotation_counter + 1
        if rotation_counter == 82 then
            rotation_counter = 0
            return value
        end
        return identity_wrapper_func(function(v) return v end)(value)
    end)(input_value)
end

local function obfuscated_value_wrapper(input_value)
    local rotation_counter = 0

    local metatable_wrapper = function(wrapped_value)
        return {
            __index = function()
                return wrapped_value
            end
        }
    end

    return (function(value)
        rotation_counter = rotation_counter + 1
        if rotation_counter == 82 then
            rotation_counter = 0
            return value
        end
        return metatable_wrapper({
            __index = function()
                return value
            end
        }).__index()
    end)(input_value)
end

local xpcall_fail_count = 0
xpcall(tostring, function() xpcall_fail_count = xpcall_fail_count + 1 end)
xpcall(lua_setmetatable, function() xpcall_fail_count = xpcall_fail_count + 1 end)
xpcall(setfenv, function() xpcall_fail_count = xpcall_fail_count + 1 end)
xpcall(buffer.tostring, function() xpcall_fail_count = xpcall_fail_count + 1 end)

if xpcall_fail_count ~= 4 then
    handle_crash_error(2)
    while true do end
end

local module_loader = {
    cache = {},

    load = function(module_name)
        if not module_loader.cache[module_name] then
            module_loader.cache[module_name] = { 
                content = module_loader[module_name]() 
            }
        end
        return module_loader.cache[module_name].content
    end
}

module_loader.a = function()
    return {
        generateSeed = function()
            local current_time = os.time()
            local current_clock = os.clock()
            local random_floor = math.floor(math.random() * 1000000)
            return (current_time * 1664525 + current_clock + random_floor) % 4294967296
        end,

        lcg = function(seed, iteration_count, min_value, max_value)
            local result_table = {}
            local current_seed = seed

            for i = 1, iteration_count do
                current_seed = (1664525 * current_seed + 1013904223) % 4294967296
                result_table[i] = min_value + current_seed % (max_value - min_value + 1)
            end

            return result_table
        end,

        sign = function(signature_base, data_to_sign)
            return signature_base + (#data_to_sign % 1000) ^ 2
        end
    }
end

module_loader.b = function()
    return {
        AES = function(input_key)

            local sbox_buffer = buffer_create(131072)
            local mix_columns_1 = buffer_create(65536)
            local mix_columns_2 = buffer_create(65536)
            local inv_mix_columns_1 = buffer_create(65536)
            local inv_mix_columns_2 = buffer_create(65536)
            local inv_mix_columns_3 = buffer_create(65536)

            local cipher_modes = {
                FwdMode = function(encrypt_func, _, input_buffer, output_buffer, _, iv)
                    local data_length = buffer_len(input_buffer) - 16
                    lua_assert(data_length % 16 == 0, "Input length must be a multiple of 16 bytes")

                    local iv_buffer = iv or buffer_create(16)
                    lua_assert(buffer_len(iv_buffer) == 16, "Initialization vector must be 16 bytes long")

                    buffer_writeu32(output_buffer, 0, bit_xor(buffer_readu32(input_buffer, 0), buffer_readu32(iv_buffer, 0)))
                    buffer_writeu32(output_buffer, 4, bit_xor(buffer_readu32(input_buffer, 4), buffer_readu32(iv_buffer, 4)))
                    buffer_writeu32(output_buffer, 8, bit_xor(buffer_readu32(input_buffer, 8), buffer_readu32(iv_buffer, 8)))
                    buffer_writeu32(output_buffer, 12, bit_xor(buffer_readu32(input_buffer, 12), buffer_readu32(iv_buffer, 12)))

                    encrypt_func(output_buffer, 0, output_buffer, 0)

                    for offset = 16, data_length, 16 do
                        buffer_writeu32(output_buffer, offset, 
                            bit_xor(buffer_readu32(input_buffer, offset), buffer_readu32(output_buffer, offset - 16)))
                        buffer_writeu32(output_buffer, offset + 4, 
                            bit_xor(buffer_readu32(input_buffer, offset + 4), buffer_readu32(output_buffer, offset - 12)))
                        buffer_writeu32(output_buffer, offset + 8, 
                            bit_xor(buffer_readu32(input_buffer, offset + 8), buffer_readu32(output_buffer, offset - 8)))
                        buffer_writeu32(output_buffer, offset + 12, 
                            bit_xor(buffer_readu32(input_buffer, offset + 12), buffer_readu32(output_buffer, offset - 4)))

                        encrypt_func(output_buffer, offset, output_buffer, offset)
                    end
                end,

                InvMode = function(_, decrypt_func, input_buffer, output_buffer, _, iv)
                    local data_length = buffer_len(input_buffer) - 16
                    lua_assert(data_length % 16 == 0, "Input length must be a multiple of 16 bytes")

                    local iv_buffer = iv or buffer_create(16)
                    lua_assert(buffer_len(iv_buffer) == 16, "Initialization vector must be 16 bytes long")

                    local prev_block = {
                        buffer_readu32(input_buffer, 0),
                        buffer_readu32(input_buffer, 4),
                        buffer_readu32(input_buffer, 8),
                        buffer_readu32(input_buffer, 12)
                    }

                    decrypt_func(input_buffer, 0, output_buffer, 0)

                    buffer_writeu32(output_buffer, 0, bit_xor(buffer_readu32(output_buffer, 0), buffer_readu32(iv_buffer, 0)))
                    buffer_writeu32(output_buffer, 4, bit_xor(buffer_readu32(output_buffer, 4), buffer_readu32(iv_buffer, 4)))
                    buffer_writeu32(output_buffer, 8, bit_xor(buffer_readu32(output_buffer, 8), buffer_readu32(iv_buffer, 8)))
                    buffer_writeu32(output_buffer, 12, bit_xor(buffer_readu32(output_buffer, 12), buffer_readu32(iv_buffer, 12)))

                    for offset = 16, data_length, 16 do
                        local current_block = {
                            buffer_readu32(input_buffer, offset),
                            buffer_readu32(input_buffer, offset + 4),
                            buffer_readu32(input_buffer, offset + 8),
                            buffer_readu32(input_buffer, offset + 12)
                        }

                        decrypt_func(input_buffer, offset, output_buffer, offset)

                        buffer_writeu32(output_buffer, offset, bit_xor(buffer_readu32(output_buffer, offset), prev_block[1]))
                        buffer_writeu32(output_buffer, offset + 4, bit_xor(buffer_readu32(output_buffer, offset + 4), prev_block[2]))
                        buffer_writeu32(output_buffer, offset + 8, bit_xor(buffer_readu32(output_buffer, offset + 8), prev_block[3]))
                        buffer_writeu32(output_buffer, offset + 12, bit_xor(buffer_readu32(output_buffer, offset + 12), prev_block[4]))

                        prev_block = current_block
                    end
                end
            }

            local padding_utilities = {
                Pad = function(input_data, output_buffer, block_size)
                    local current_length = buffer_len(input_data)
                    local aligned_length = current_length - current_length % block_size

                    if output_buffer then
                        lua_assert(buffer_len(output_buffer) >= current_length + block_size, 
                            "Output buffer out of bounds")
                    else
                        output_buffer = buffer_create(aligned_length + block_size)
                    end

                    local padding_amount = block_size - current_length % block_size
                    buffer_copy(output_buffer, 0, input_data, 0, current_length)
                    buffer_fill(output_buffer, current_length, padding_amount, padding_amount)

                    return output_buffer
                end,

                Unpad = function(input_data, output_buffer, block_size)
                    local padded_length = buffer_len(input_data)
                    local padding_value = buffer_readu8(input_data, padded_length - 1)
                    local data_length = padded_length - padding_value

                    lua_assert(padding_value > 0 and padding_value <= block_size, "Got unexpected padding")

                    for i = data_length, padded_length - 2 do
                        if buffer_readu8(input_data, i) ~= padding_value then
                            lua_error("Got unexpected padding")
                        end
                    end

                    if output_buffer then
                        lua_assert(buffer_len(output_buffer) >= data_length, "Output buffer out of bounds")
                    else
                        output_buffer = buffer_create(data_length)
                    end

                    buffer_copy(output_buffer, 0, input_data, 0, data_length)
                    return output_buffer
                end,

                Overwrite = nil
            }

            local function key_expansion(key_source, key_length, round_keys_buffer, is_buffer)
                if is_buffer then
                    buffer_copy(round_keys_buffer, 0, key_source, 0, key_length)
                else
                    buffer_writestring(round_keys_buffer, 0, key_source, key_length)
                end

                local rcon_word = bit_rrotate(buffer_readu32(round_keys_buffer, key_length - 4), 8)
                local rcon_value = 0.5

                if key_length == 32 then

                    for offset = 32, 192, 32 do
                        rcon_value = rcon_value * 2 % 229

                        local temp1 = bit_xor(
                            buffer_readu32(round_keys_buffer, offset - 32),
                            buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                            buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                            rcon_value
                        )
                        buffer_writeu32(round_keys_buffer, offset, temp1)

                        local temp2 = bit_xor(buffer_readu32(round_keys_buffer, offset - 28), temp1)
                        buffer_writeu32(round_keys_buffer, offset + 4, temp2)

                        local temp3 = bit_xor(buffer_readu32(round_keys_buffer, offset - 24), temp2)
                        buffer_writeu32(round_keys_buffer, offset + 8, temp3)

                        local temp4 = bit_xor(buffer_readu32(round_keys_buffer, offset - 20), temp3)
                        buffer_writeu32(round_keys_buffer, offset + 12, temp4)

                        local temp5 = bit_xor(
                            buffer_readu32(round_keys_buffer, offset - 16),
                            buffer_readu16(sbox_buffer, math_floor(temp4 / 65536) * 2) * 65536 + 
                            buffer_readu16(sbox_buffer, temp4 % 65536 * 2)
                        )
                        buffer_writeu32(round_keys_buffer, offset + 16, temp5)

                        local temp6 = bit_xor(buffer_readu32(round_keys_buffer, offset - 12), temp5)
                        buffer_writeu32(round_keys_buffer, offset + 20, temp6)

                        local temp7 = bit_xor(buffer_readu32(round_keys_buffer, offset - 8), temp6)
                        buffer_writeu32(round_keys_buffer, offset + 24, temp7)

                        local temp8 = bit_xor(buffer_readu32(round_keys_buffer, offset - 4), temp7)
                        buffer_writeu32(round_keys_buffer, offset + 28, temp8)

                        rcon_word = bit_rrotate(temp8, 8)
                    end

                    local final1 = bit_xor(
                        buffer_readu32(round_keys_buffer, 192),
                        buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                        buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                        64
                    )
                    buffer_writeu32(round_keys_buffer, 224, final1)

                    local final2 = bit_xor(buffer_readu32(round_keys_buffer, 196), final1)
                    buffer_writeu32(round_keys_buffer, 228, final2)

                    local final3 = bit_xor(buffer_readu32(round_keys_buffer, 200), final2)
                    buffer_writeu32(round_keys_buffer, 232, final3)

                    buffer_writeu32(round_keys_buffer, 236, 
                        bit_xor(buffer_readu32(round_keys_buffer, 204), final3))

                elseif key_length == 24 then

                    for offset = 24, 168, 24 do
                        rcon_value = rcon_value * 2 % 229

                        local temp1 = bit_xor(
                            buffer_readu32(round_keys_buffer, offset - 24),
                            buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                            buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                            rcon_value
                        )
                        buffer_writeu32(round_keys_buffer, offset, temp1)

                        local temp2 = bit_xor(buffer_readu32(round_keys_buffer, offset - 20), temp1)
                        buffer_writeu32(round_keys_buffer, offset + 4, temp2)

                        local temp3 = bit_xor(buffer_readu32(round_keys_buffer, offset - 16), temp2)
                        buffer_writeu32(round_keys_buffer, offset + 8, temp3)

                        local temp4 = bit_xor(buffer_readu32(round_keys_buffer, offset - 12), temp3)
                        buffer_writeu32(round_keys_buffer, offset + 12, temp4)

                        local temp5 = bit_xor(buffer_readu32(round_keys_buffer, offset - 8), temp4)
                        buffer_writeu32(round_keys_buffer, offset + 16, temp5)

                        local temp6 = bit_xor(buffer_readu32(round_keys_buffer, offset - 4), temp5)
                        buffer_writeu32(round_keys_buffer, offset + 20, temp6)

                        rcon_word = bit_rrotate(temp6, 8)
                    end

                    local final1 = bit_xor(
                        buffer_readu32(round_keys_buffer, 168),
                        buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                        buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                        128
                    )
                    buffer_writeu32(round_keys_buffer, 192, final1)

                    local final2 = bit_xor(buffer_readu32(round_keys_buffer, 172), final1)
                    buffer_writeu32(round_keys_buffer, 196, final2)

                    local final3 = bit_xor(buffer_readu32(round_keys_buffer, 176), final2)
                    buffer_writeu32(round_keys_buffer, 200, final3)

                    buffer_writeu32(round_keys_buffer, 204, 
                        bit_xor(buffer_readu32(round_keys_buffer, 180), final3))

                else

                    for offset = 16, 144, 16 do
                        rcon_value = rcon_value * 2 % 229

                        local temp1 = bit_xor(
                            buffer_readu32(round_keys_buffer, offset - 16),
                            buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                            buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                            rcon_value
                        )
                        buffer_writeu32(round_keys_buffer, offset, temp1)

                        local temp2 = bit_xor(buffer_readu32(round_keys_buffer, offset - 12), temp1)
                        buffer_writeu32(round_keys_buffer, offset + 4, temp2)

                        local temp3 = bit_xor(buffer_readu32(round_keys_buffer, offset - 8), temp2)
                        buffer_writeu32(round_keys_buffer, offset + 8, temp3)

                        local temp4 = bit_xor(buffer_readu32(round_keys_buffer, offset - 4), temp3)
                        buffer_writeu32(round_keys_buffer, offset + 12, temp4)

                        rcon_word = bit_rrotate(temp4, 8)
                    end

                    local final1 = bit_xor(
                        buffer_readu32(round_keys_buffer, 144),
                        buffer_readu16(sbox_buffer, math_floor(rcon_word / 65536) * 2) * 65536 + 
                        buffer_readu16(sbox_buffer, rcon_word % 65536 * 2),
                        54
                    )
                    buffer_writeu32(round_keys_buffer, 160, final1)

                    local final2 = bit_xor(buffer_readu32(round_keys_buffer, 148), final1)
                    buffer_writeu32(round_keys_buffer, 164, final2)

                    local final3 = bit_xor(buffer_readu32(round_keys_buffer, 152), final2)
                    buffer_writeu32(round_keys_buffer, 168, final3)

                    buffer_writeu32(round_keys_buffer, 172, 
                        bit_xor(buffer_readu32(round_keys_buffer, 156), final3))
                end

                return round_keys_buffer
            end

            local function encrypt_block(round_keys, max_offset, input_buffer, input_offset, output_buffer, output_offset)

                local state = {}
                for i = 0, 15 do
                    state[i] = bit_xor(
                        buffer_readu8(input_buffer, input_offset + i),
                        buffer_readu8(round_keys, i)
                    )
                end

                local word_state = {}
                word_state[0] = state[0] * 256 + state[5]
                word_state[1] = state[5] * 256 + state[10]
                word_state[2] = state[10] * 256 + state[15]
                word_state[3] = state[15] * 256 + state[0]
                word_state[4] = state[4] * 256 + state[9]
                word_state[5] = state[9] * 256 + state[14]
                word_state[6] = state[14] * 256 + state[3]
                word_state[7] = state[3] * 256 + state[4]
                word_state[8] = state[8] * 256 + state[13]
                word_state[9] = state[13] * 256 + state[2]
                word_state[10] = state[2] * 256 + state[7]
                word_state[11] = state[7] * 256 + state[8]
                word_state[12] = state[12] * 256 + state[1]
                word_state[13] = state[1] * 256 + state[6]
                word_state[14] = state[6] * 256 + state[11]
                word_state[15] = state[11] * 256 + state[12]

                for round_offset = 16, max_offset, 16 do
                    local mixed_state = {}

                    for i = 0, 15 do
                        mixed_state[i] = bit_xor(
                            buffer_readu8(mix_columns_1, word_state[i]),
                            buffer_readu8(mix_columns_2, word_state[(i + 2) % 16]),
                            buffer_readu8(round_keys, round_offset + i)
                        )
                    end

                    for i = 0, 15 do
                        local idx1 = i
                        local idx2 = (i + 5) % 16
                        word_state[i] = mixed_state[idx1] * 256 + mixed_state[idx2]
                    end
                end

                local final_offset = max_offset + 16
                for i = 0, 3 do
                    local word_val = bit_xor(
                        buffer_readu16(sbox_buffer, bit_xor(
                            buffer_readu8(mix_columns_1, word_state[15 - i * 4]),
                            buffer_readu8(mix_columns_2, word_state[13 - i * 4]),
                            buffer_readu8(round_keys, final_offset + 15 - i * 4)
                        ) * 512 + bit_xor(
                            buffer_readu8(mix_columns_1, word_state[10 - i * 4]),
                            buffer_readu8(mix_columns_2, word_state[8 - i * 4]),
                            buffer_readu8(round_keys, final_offset + 10 - i * 4)
                        ) * 2) * 65536 + buffer_readu16(sbox_buffer, bit_xor(
                            buffer_readu8(mix_columns_1, word_state[5 - i * 4]),
                            buffer_readu8(mix_columns_2, word_state[7 - i * 4]),
                            buffer_readu8(round_keys, final_offset + 5 - i * 4)
                        ) * 512 + bit_xor(
                            buffer_readu8(mix_columns_1, word_state[0 - i * 4]),
                            buffer_readu8(mix_columns_2, word_state[2 - i * 4]),
                            buffer_readu8(round_keys, final_offset + 0 - i * 4)
                        ) * 2),
                        buffer_readu32(round_keys, final_offset + 16 + i * 4)
                    )

                    buffer_writeu32(output_buffer, output_offset + i * 4, word_val)
                end
            end

            local function decrypt_block(round_keys, max_offset, input_buffer, input_offset, output_buffer, output_offset)

                local final_state = {}
                for i = 0, 15 do
                    final_state[i] = bit_xor(
                        buffer_readu8(inv_mix_columns_1, 
                            buffer_readu8(input_buffer, input_offset + i) * 256 + 
                            buffer_readu8(round_keys, max_offset + 32 + i)),
                        buffer_readu8(round_keys, max_offset + 16 + i)
                    )
                end

                local word_state = {}
                for i = 0, 15 do
                    word_state[i] = final_state[i] * 256 + final_state[(i + 1) % 16]
                end

                for round_offset = max_offset, 16, -16 do
                    local next_state = {}

                    for i = 0, 15 do
                        next_state[i] = bit_xor(
                            buffer_readu8(inv_mix_columns_1, 
                                buffer_readu8(inv_mix_columns_2, word_state[i]) * 256 + 
                                buffer_readu8(inv_mix_columns_3, word_state[(i + 2) % 16])),
                            buffer_readu8(round_keys, round_offset + i)
                        )
                    end

                    for i = 0, 15 do
                        word_state[i] = next_state[i] * 256 + next_state[(i + 1) % 16]
                    end
                end

                for i = 0, 3 do
                    local word_val = bit_xor(
                        buffer_readu8(inv_mix_columns_1, 
                            buffer_readu8(inv_mix_columns_2, word_state[7 - i]) * 256 + 
                            buffer_readu8(inv_mix_columns_3, word_state[5 - i])),
                        buffer_readu8(round_keys, 3 - i)
                    ) * 16777216 + bit_xor(
                        buffer_readu8(inv_mix_columns_1, 
                            buffer_readu8(inv_mix_columns_2, word_state[10 - i]) * 256 + 
                            buffer_readu8(inv_mix_columns_3, word_state[8 - i])),
                        buffer_readu8(round_keys, 2 - i)
                    ) * 65536 + bit_xor(
                        buffer_readu8(inv_mix_columns_1, 
                            buffer_readu8(inv_mix_columns_2, word_state[13 - i]) * 256 + 
                            buffer_readu8(inv_mix_columns_3, word_state[15 - i])),
                        buffer_readu8(round_keys, 1 - i)
                    ) * 256 + bit_xor(
                        buffer_readu8(inv_mix_columns_1, 
                            buffer_readu8(inv_mix_columns_2, word_state[0 - i]) * 256 + 
                            buffer_readu8(inv_mix_columns_3, word_state[2 - i])),
                        buffer_readu8(round_keys, 0 - i)
                    )

                    buffer_writeu32(output_buffer, output_offset + i * 4, word_val)
                end
            end

            local sbox_forward = buffer_create(256)
            local sbox_inverse = buffer_create(256)
            local gf_mult_3 = buffer_create(256)
            local gf_mult_9 = buffer_create(256)
            local gf_mult_11 = buffer_create(256)

            local function galois_multiply(a, b)
                local result = 0
                for i = 0, 7 do
                    if b % 2 == 1 then
                        result = bit_xor(result, a)
                    end
                    a = a < 128 and a * 2 % 256 or bit_xor(a * 2 % 256, 27)
                    b = math_floor(b / 2)
                end
                return result
            end

            buffer_writeu8(sbox_forward, 0, 99)
            local power_alpha = 1
            local inverse_value = 1

            for i = 1, 255 do
                power_alpha = bit_xor(power_alpha, power_alpha * 2, power_alpha < 128 and 0 or 27) % 256

                local temp1 = bit_xor(inverse_value, inverse_value * 2)
                local temp2 = bit_xor(temp1, temp1 * 4)
                inverse_value = bit_xor(temp2, temp2 * 16) % 256

                if inverse_value >= 128 then
                    inverse_value = bit_xor(inverse_value, 9)
                end

                local sbox_value = bit_xor(
                    inverse_value,
                    inverse_value % 128 * 2 + inverse_value / 128,
                    inverse_value % 64 * 4 + inverse_value / 64,
                    inverse_value % 32 * 8 + inverse_value / 32,
                    inverse_value % 16 * 16 + inverse_value / 16,
                    99
                )

                buffer_writeu8(sbox_forward, power_alpha, sbox_value)
                buffer_writeu8(sbox_inverse, sbox_value, power_alpha)
                buffer_writeu8(gf_mult_3, power_alpha, galois_multiply(3, power_alpha))
                buffer_writeu8(gf_mult_9, power_alpha, galois_multiply(9, power_alpha))
                buffer_writeu8(gf_mult_11, power_alpha, galois_multiply(11, power_alpha))
            end

            local lookup_index = 0
            for outer = 0, 255 do
                local sbox_val = buffer_readu8(sbox_forward, outer)
                local sbox_shifted = sbox_val * 256
                local gf2_val = galois_multiply(2, sbox_val)
                local gf13_val = galois_multiply(13, outer)
                local gf14_val = galois_multiply(14, outer)

                for inner = 0, 255 do
                    local sbox_inner = buffer_readu8(sbox_forward, inner)

                    buffer_writeu16(sbox_buffer, lookup_index * 2, sbox_shifted + sbox_inner)
                    buffer_writeu8(inv_mix_columns_1, lookup_index, 
                        buffer_readu8(sbox_inverse, bit_xor(outer, inner)))
                    buffer_writeu8(mix_columns_1, lookup_index, 
                        bit_xor(gf2_val, buffer_readu8(gf_mult_3, sbox_inner)))
                    buffer_writeu8(mix_columns_2, lookup_index, 
                        bit_xor(sbox_val, sbox_inner))
                    buffer_writeu8(inv_mix_columns_2, lookup_index, 
                        bit_xor(gf14_val, buffer_readu8(gf_mult_11, inner)))
                    buffer_writeu8(inv_mix_columns_3, lookup_index, 
                        bit_xor(gf13_val, buffer_readu8(gf_mult_9, inner)))

                    lookup_index = lookup_index + 1
                end
            end

            local function aes_newindex_error(tbl, key)
                return lua_error(string.format("%s cannot be assigned to", tostring(key)))
            end

            local function aes_tostring()
                return "AesCipher"
            end

            local function create_round_keys(key_data, output_buffer)
                local is_buffer = lua_typeof(key_data) == "buffer"
                local key_length = is_buffer and buffer_len(key_data) or #key_data

                local round_keys_size = key_length == 32 and 240 
                    or key_length == 16 and 176 
                    or key_length == 24 and 208 
                    or lua_error("Key must be either 16, 24 or 32 bytes long")

                return key_expansion(key_data, key_length, 
                    output_buffer or buffer_create(round_keys_size), is_buffer)
            end

            return (function(round_keys_data, cipher_mode_config, padding_config)
                local round_keys_length = buffer_len(round_keys_data)
                local max_round_offset
                local original_key
                local round_keys_string = buffer_tostring(round_keys_data)

                if round_keys_length == 240 then
                    max_round_offset = 192
                    original_key = string_sub(round_keys_string, 1, 32)
                elseif round_keys_length == 208 then
                    max_round_offset = 160
                    original_key = string_sub(round_keys_string, 1, 24)
                elseif round_keys_length == 176 then
                    max_round_offset = 128
                    original_key = string_sub(round_keys_string, 1, 16)
                else
                    lua_error("Round keys must be either 240, 208 or 176 bytes long")
                end

                local round_keys_buffer = round_keys_data
                local cipher_mode = cipher_mode_config or cipher_modes
                local forward_mode = cipher_mode.FwdMode
                local inverse_mode = cipher_mode.InvMode
                local segment_size = cipher_mode.SegmentSize or 16
                local padding_mode = padding_config or padding_utilities
                local pad_func = padding_mode.Pad
                local unpad_func = padding_mode.Unpad

                local cipher_proxy = lua_newproxy(true)
                local proxy_mt = lua_getmetatable(cipher_proxy)

                local function encrypt_block_wrapper(input_buf, in_off, output_buf, out_off)
                    encrypt_block(round_keys_buffer, max_round_offset, 
                        input_buf, in_off, output_buf, out_off)
                end

                local function decrypt_block_wrapper(input_buf, in_off, output_buf, out_off)
                    decrypt_block(round_keys_buffer, max_round_offset, 
                        input_buf, in_off, output_buf, out_off)
                end

                local function encrypt_method(self, input_data, output_buf, ...)
                    local input_type = lua_typeof(input_data)
                    local input_buffer = input_type == "buffer" and input_data
                        or input_type == "string" and buffer_fromstring(input_data)
                        or lua_error(string.format("Unable to cast %s to buffer", tostring(input_type)))

                    local output_buffer = lua_typeof(output_buf) == "buffer" and output_buf or nil

                    if self ~= cipher_proxy then
                        return self:Encrypt(input_buffer, output_buffer, ...)
                    end

                    if max_round_offset then
                        local padded_buffer = pad_func(input_buffer, output_buffer, segment_size)
                        forward_mode(encrypt_block_wrapper, decrypt_block_wrapper,
                            padding_mode.Overwrite == false and input_buffer or padded_buffer,
                            padded_buffer, cipher_mode, ...)
                        return padded_buffer
                    end

                    lua_error("AesCipher object's already destroyed")
                    return buffer_create(0)
                end

                local function encrypt_block_method(self, input_buf, in_off, output_buf, out_off)
                    if self ~= cipher_proxy then
                        self:EncryptBlock(input_buf, in_off, output_buf, out_off)
                    elseif max_round_offset then
                        encrypt_block(round_keys_buffer, max_round_offset, 
                            input_buf, in_off, output_buf or input_buf, out_off or in_off)
                    else
                        lua_error("AesCipher object's already destroyed")
                    end
                end

                local function decrypt_method(self, input_data, output_buf, ...)
                    local input_type = lua_typeof(input_data)
                    local input_buffer = input_type == "buffer" and input_data
                        or input_type == "string" and buffer_fromstring(input_data)
                        or lua_error(string.format("Unable to cast %s to buffer", tostring(input_type)))

                    local output_buffer = lua_typeof(output_buf) == "buffer" and output_buf or nil

                    if self ~= cipher_proxy then
                        return self:Decrypt(input_buffer, output_buffer, ...)
                    end

                    if max_round_offset then
                        local overwrite = padding_mode.Overwrite
                        local intermediate_buffer = overwrite == nil and buffer_create(buffer_len(input_buffer))
                            or overwrite and input_buffer
                            or output_buffer or buffer_create(buffer_len(input_buffer))

                        inverse_mode(encrypt_block_wrapper, decrypt_block_wrapper,
                            input_buffer, intermediate_buffer, cipher_mode, ...)

                        return unpad_func(intermediate_buffer, output_buffer, segment_size)
                    end

                    lua_error("AesCipher object's already destroyed")
                    return buffer_create(0)
                end

                local function decrypt_block_method(self, input_buf, in_off, output_buf, out_off)
                    if self ~= cipher_proxy then
                        self:DecryptBlock(input_buf, in_off, output_buf, out_off)
                    elseif max_round_offset then
                        decrypt_block(round_keys_buffer, max_round_offset,
                            input_buf, in_off, output_buf or input_buf, out_off or in_off)
                    else
                        lua_error("AesCipher object's already destroyed")
                    end
                end

                local function destroy_method(self)
                    if self ~= cipher_proxy then
                        self:Destroy()
                    elseif max_round_offset then
                        round_keys_string = nil
                        round_keys_buffer = nil
                        max_round_offset = nil
                        forward_mode = nil
                        inverse_mode = nil
                        cipher_mode = nil
                        padding_mode = nil
                        original_key = nil
                        round_keys_length = nil
                    else
                        lua_error("AesCipher object's already destroyed")
                    end
                end

                local methods = {
                    Encrypt = encrypt_method,
                    Decrypt = decrypt_method,
                    EncryptBlock = encrypt_block_method,
                    DecryptBlock = decrypt_block_method,
                    Destroy = destroy_method
                }

                local properties = {
                    Key = original_key,
                    RoundKeys = round_keys_string,
                    Mode = cipher_mode,
                    Padding = padding_mode,
                    Length = round_keys_length
                }

                proxy_mt.__index = function(self, key)
                    if methods[key] then
                        return methods[key]
                    end

                    if max_round_offset and properties[key] then
                        return properties[key]
                    end

                    if max_round_offset then
                        lua_error(("%s is not a valid member of AesCipher"):format(key))
                    else
                        lua_error("AesCipher object's already destroyed")
                    end
                end

                proxy_mt.__newindex = aes_newindex_error
                proxy_mt.__tostring = aes_tostring
                proxy_mt.__len = function()
                    return round_keys_length or lua_error("AesCipher object's destroyed")
                end
                proxy_mt.__metatable = "AesCipher object: Metatable's locked"

                return cipher_proxy
            end)(create_round_keys(input_key), cipher_modes, padding_utilities)
        end,

        ECC = function(context)

            local function reduce_modulo_prime(word_array)
                for i = 0, 15 do
                    word_array[i] = word_array[i] + 65536
                    local carry = word_array[i] / 65536 - word_array[i] / 65536 % 1

                    if i < 15 then
                        word_array[i + 1] = word_array[i + 1] + carry - 1
                    else
                        word_array[0] = word_array[0] + 38 * (carry - 1)
                    end

                    word_array[i] = word_array[i] - carry * 65536
                end
            end

            local function conditional_swap(array_a, array_b, condition)
                for i = 0, 15 do
                    array_a[i], array_b[i] = 
                        array_a[i] * ((condition - 1) % 2) + array_b[i] * condition,
                        array_b[i] * ((condition - 1) % 2) + array_a[i] * condition
                end
            end

            local function bytes_to_words(output_words, input_bytes)
                for i = 0, 15 do
                    output_words[i] = input_bytes[2 * i] + input_bytes[2 * i + 1] * 256
                end
                output_words[15] = output_words[15] % 32768
            end

            local function words_to_bytes(output_bytes, input_words)
                local temp1 = {}
                local temp2 = {}

                for i = 0, 15 do
                    temp1[i] = input_words[i]
                end

                reduce_modulo_prime(temp1)
                reduce_modulo_prime(temp1)
                reduce_modulo_prime(temp1)

                local prime_words = {[0] = 65517, [15] = 32767}
                for i = 1, 14 do
                    prime_words[i] = 65535
                end

                for iteration = 0, 1 do
                    temp2[0] = temp1[0] - prime_words[0]

                    for i = 1, 15 do
                        temp2[i] = temp1[i] - prime_words[i] - 
                            (temp2[i - 1] / 65536 - temp2[i - 1] / 65536 % 1) % 2
                        temp2[i - 1] = (temp2[i - 1] + 65536) % 65536
                    end

                    local reduction_condition = (temp2[15] / 65536 - temp2[15] / 65536 % 1) % 2
                    conditional_swap(temp1, temp2, 1 - reduction_condition)
                end

                for i = 0, 15 do
                    output_bytes[2 * i] = temp1[i] % 256
                    output_bytes[2 * i + 1] = temp1[i] / 256 - temp1[i] / 256 % 1
                end
            end

            local function word_array_add(result, array_a, array_b)
                for i = 0, 15 do
                    result[i] = array_a[i] + array_b[i]
                end
            end

            local function word_array_subtract(result, array_a, array_b)
                for i = 0, 15 do
                    result[i] = array_a[i] - array_b[i]
                end
            end

            local function word_array_multiply(result, array_a, array_b)
                local intermediate = {}

                for i = 0, 31 do
                    intermediate[i] = 0
                end

                for i = 0, 15 do
                    for j = 0, 15 do
                        intermediate[i + j] = intermediate[i + j] + array_a[i] * array_b[j]
                    end
                end

                for i = 0, 14 do
                    intermediate[i] = intermediate[i] + 38 * intermediate[i + 16]
                end

                for i = 0, 15 do
                    result[i] = intermediate[i]
                end

                reduce_modulo_prime(result)
                reduce_modulo_prime(result)
            end

            local function modular_inverse(result, input)
                local temp = {}

                for i = 0, 15 do
                    temp[i] = input[i]
                end

                for exponent = 253, 0, -1 do
                    word_array_multiply(temp, temp, temp)

                    if exponent ~= 2 and exponent ~= 4 then
                        word_array_multiply(temp, temp, input)
                    end
                end

                for i = 0, 15 do
                    result[i] = temp[i]
                end
            end

            local function scalar_multiplication(result_bytes, scalar_bytes, point_bytes)
                local r_x = {}
                local r_z = {}
                local q_x = {}
                local q_z = {}
                local temp_add = {}
                local temp_mult = {}
                local input_point = {}
                local working_scalar = {}

                bytes_to_words(input_point, point_bytes)

                for i = 0, 15 do
                    r_x[i] = 0
                    r_z[i] = input_point[i]
                    q_x[i] = 0
                    q_z[i] = 0
                end

                r_x[0] = 1
                q_z[0] = 1

                for i = 0, 30 do
                    working_scalar[i] = scalar_bytes[i]
                end

                working_scalar[0] = working_scalar[0] - working_scalar[0] % 8
                working_scalar[31] = scalar_bytes[31] % 64 + 64

                for bit_position = 254, 0, -1 do
                    local bit_value = (working_scalar[bit_position / 8 - bit_position / 8 % 1] / 
                        2 ^ (bit_position % 8) - working_scalar[bit_position / 8 - bit_position / 8 % 1] / 
                        2 ^ (bit_position % 8) % 1) % 2

                    conditional_swap(r_x, r_z, bit_value)
                    conditional_swap(q_x, q_z, bit_value)

                    word_array_add(temp_add, r_x, q_x)
                    word_array_subtract(r_x, r_x, q_x)
                    word_array_add(q_x, r_z, q_z)
                    word_array_subtract(r_z, r_z, q_z)

                    word_array_multiply(q_z, temp_add, temp_add)
                    word_array_multiply(temp_mult, r_x, r_x)
                    word_array_multiply(r_x, q_x, r_x)
                    word_array_multiply(q_x, r_z, temp_add)

                    word_array_add(temp_add, r_x, q_x)
                    word_array_subtract(r_x, r_x, q_x)
                    word_array_multiply(r_z, r_x, r_x)
                    word_array_subtract(q_x, q_z, temp_mult)

                    word_array_multiply(r_x, q_x, 
                        {[0] = 56129, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})

                    word_array_add(r_x, r_x, q_z)
                    word_array_multiply(q_x, q_x, r_x)
                    word_array_multiply(r_x, q_z, temp_mult)
                    word_array_multiply(q_z, r_z, input_point)
                    word_array_multiply(r_z, temp_add, temp_add)

                    conditional_swap(r_x, r_z, bit_value)
                    conditional_swap(q_x, q_z, bit_value)
                end

                modular_inverse(q_x, q_x)
                word_array_multiply(r_x, r_x, q_x)
                words_to_bytes(result_bytes, r_x)
            end

            local function generate_keypair(rng_function)
                local rng = rng_function or function()
                    return math.random(0, 255)
                end

                local private_key = {}
                local public_key = {}

                for i = 0, 31 do
                    private_key[i] = rng()
                end

                local base_point = {[0] = 9}
                for i = 1, 31 do
                    base_point[i] = 0
                end

                scalar_multiplication(public_key, private_key, base_point)

                return private_key, public_key
            end

            local function get_shared_secret(private_key, public_key)
                local shared_secret = {}
                scalar_multiplication(shared_secret, private_key, public_key)
                return shared_secret
            end

            return {
                generate_keypair = generate_keypair,
                get_shared_key = get_shared_secret
            }
        end,

        HASH = function(input_string)

            local function create_memoized_table(generator_func)
                local cache_mt = {}
                local cache_proxy = lua_setmetatable({}, cache_mt)

                cache_mt.__index = function(self, key)
                    local value = generator_func(key)
                    cache_proxy[key] = value
                    return value
                end

                return cache_proxy
            end

            local function create_mixer(lookup_table, base)
                return function(a, b)
                    local result = 0
                    local power = 1

                    while a ~= 0 and b ~= 0 do
                        local a_mod = a % base
                        local b_mod = b % base
                        result = result + lookup_table[a_mod][b_mod] * power
                        a = (a - a_mod) / base
                        b = (b - b_mod) / base
                        power = power * base
                    end

                    return result + (a + b) * power
                end
            end

            local xor_mixer = (function(initial_table)
                local base_mixer = create_mixer(initial_table, 2)
                local memoized_layer = create_memoized_table(function(key_a)
                    return create_memoized_table(function(key_b)
                        return base_mixer(key_a, key_b)
                    end)
                end)
                return create_mixer(memoized_layer, 2 ^ (initial_table.n or 1))
            end)({
                [0] = {[0] = 0, [1] = 1},
                {[0] = 1, [1] = 0},
                n = 4
            })

            local function bit_xor_multi(a, b, c, ...)
                if b then
                    local a_mod = a % 4294967296
                    local b_mod = b % 4294967296
                    local result = xor_mixer(a_mod, b_mod)

                    if c then
                        result = bit_xor_multi(result, c, ...)
                    end

                    return result
                end

                if a then
                    return a % 4294967296
                end

                return 0
            end

            local function bit_and_multi(a, b, c, ...)
                if b then
                    local a_mod = a % 4
local b_mod = b % 4294967296
                    local result = (a_mod + b_mod - xor_mixer(a_mod, b_mod)) / 2

                    if c then
                        result = bit_and_multi(result, c, ...)
                    end

                    return result
                end

                if a then
                    return a % 4294967296
                end

                return 4294967295
            end

            local function bit_not(value)
                return (-1 - value) % 4294967296
            end

            local function bit_arshift(value, shift_amount)
                if shift_amount < 0 then
                    return bit_lshift(value, -shift_amount)
                end
                return math.floor(value % 4294967296 / 2 ^ shift_amount)
            end

            local function bit_rshift(value, shift_amount)
                if shift_amount > 31 or shift_amount < -31 then
                    return 0
                end
                return bit_arshift(value % 4294967296, shift_amount)
            end

            local function bit_lshift(value, shift_amount)
                if shift_amount < 0 then
                    return bit_rshift(value, -shift_amount)
                end
                return value * 2 ^ shift_amount % 4294967296
            end

            local function bit_rrotate(value, rotate_amount)
                local value_mod = value % 4294967296
                local rotate_mod = rotate_amount % 32
                local rotated_mask = bit_and_multi(value_mod, 2 ^ rotate_mod - 1)
                return bit_rshift(value_mod, rotate_mod) + bit_lshift(rotated_mask, 32 - rotate_mod)
            end

            local sha256_constants = {
                1116352408, 1899447441, 3049323471, 3921009573, 961987163, 1508970993,
                2453635748, 2870763221, 3624381080, 310598401, 607225278, 1426881987,
                1925078388, 2162078206, 2614888103, 3248222580, 3835390401, 4022224774,
                264347078, 604807628, 770255983, 1249150122, 1555081692, 1996064986,
                2554220882, 2821834349, 2952996808, 3210313671, 3336571891, 3584528711,
                113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291,
                1695183700, 1986661051, 2177026350, 2456956037, 2730485921, 2820302411,
                3259730800, 3345764771, 3516065817, 3600352804, 4094571909, 275423344,
                430227734, 506948616, 659060556, 883997877, 958139571, 1322822218,
                1537002063, 1747873779, 1955562222, 2024104815, 2227730452, 2361852424,
                2428436474, 2756734187, 3204031479, 3329325298
            }

            local function binary_to_hex(binary_string)
                return string.gsub(binary_string, ".", function(byte_char)
                    return string.format("%02x", string.byte(byte_char))
                end)
            end

            local function number_to_binary(number, byte_length)
                local result = ""

                for i = 1, byte_length do
                    local byte_val = number % 256
                    result = string.char(byte_val) .. result
                    number = (number - byte_val) / 256
                end

                return result
            end

            local function read_be_word32(input_string, start_index)
                local word = 0

                for i = start_index, start_index + 3 do
                    word = word * 256 + string.byte(input_string, i)
                end

                return word
            end

            local function sha256_pad_message(message, length)
                local padding_zeros = 64 - (length + 9) % 64
                local length_bytes = number_to_binary(8 * length, 8)
                local padded = message .. "\128" .. string.rep("\000", padding_zeros) .. length_bytes

                lua_assert(#padded % 64 == 0)
                return padded
            end

            local function initialize_hash_state(hash_state)
                hash_state[1] = 1779033703
                hash_state[2] = 3144134277
                hash_state[3] = 1013904242
                hash_state[4] = 2773480762
                hash_state[5] = 1359893119
                hash_state[6] = 2600822924
                hash_state[7] = 528734635
                hash_state[8] = 1541459225
                return hash_state
            end

            local function sha256_compress_block(padded_message, block_start, hash_state)
                local message_schedule = {}

                for i = 1, 16 do
                    message_schedule[i] = read_be_word32(padded_message, block_start + (i - 1) * 4)
                end

                for i = 17, 64 do
                    local w_15 = message_schedule[i - 15]
                    local sigma0 = bit_xor_multi(
                        bit_rrotate(w_15, 7),
                        bit_rrotate(w_15, 18),
                        bit_rshift(w_15, 3)
                    )

                    local w_2 = message_schedule[i - 2]
                    local sigma1 = bit_xor_multi(
                        bit_rrotate(w_2, 17),
                        bit_rrotate(w_2, 19),
                        bit_rshift(w_2, 10)
                    )

                    message_schedule[i] = message_schedule[i - 16] + sigma0 + 
                        message_schedule[i - 7] + sigma1
                end

                local a = hash_state[1]
                local b = hash_state[2]
                local c = hash_state[3]
                local d = hash_state[4]
                local e = hash_state[5]
                local f = hash_state[6]
                local g = hash_state[7]
                local h = hash_state[8]

                for i = 1, 64 do

                    local sigma1_e = bit_xor_multi(
                        bit_rrotate(e, 6),
                        bit_rrotate(e, 11),
                        bit_rrotate(e, 25)
                    )

                    local ch = bit_xor_multi(
                        bit_and_multi(e, f),
                        bit_and_multi(bit_not(e), g)
                    )

                    local temp1 = h + sigma1_e + ch + sha256_constants[i] + message_schedule[i]

                    local sigma0_a = bit_xor_multi(
                        bit_rrotate(a, 2),
                        bit_rrotate(a, 13),
                        bit_rrotate(a, 22)
                    )

                    local maj = bit_xor_multi(
                        bit_and_multi(a, b),
                        bit_and_multi(a, c),
                        bit_and_multi(b, c)
                    )

                    local temp2 = sigma0_a + maj

                    h = g
                    g = f
                    f = e
                    e = d + temp1
                    d = c
                    c = b
                    b = a
                    a = temp1 + temp2
                end

                hash_state[1] = bit_and_multi(hash_state[1] + a)
                hash_state[2] = bit_and_multi(hash_state[2] + b)
                hash_state[3] = bit_and_multi(hash_state[3] + c)
                hash_state[4] = bit_and_multi(hash_state[4] + d)
                hash_state[5] = bit_and_multi(hash_state[5] + e)
                hash_state[6] = bit_and_multi(hash_state[6] + f)
                hash_state[7] = bit_and_multi(hash_state[7] + g)
                hash_state[8] = bit_and_multi(hash_state[8] + h)
            end

            return (function(message)
                local padded_message = sha256_pad_message(message, #message)
                local hash_state = initialize_hash_state({})

                for block_start = 1, #padded_message, 64 do
                    sha256_compress_block(padded_message, block_start, hash_state)
                end

                return binary_to_hex(
                    number_to_binary(hash_state[1], 4) ..
                    number_to_binary(hash_state[2], 4) ..
                    number_to_binary(hash_state[3], 4) ..
                    number_to_binary(hash_state[4], 4) ..
                    number_to_binary(hash_state[5], 4) ..
                    number_to_binary(hash_state[6], 4) ..
                    number_to_binary(hash_state[7], 4) ..
                    number_to_binary(hash_state[8], 4)
                )
            end)(input_string)
        end
    }
end

module_loader.c = function()
    return {

        padString = function(input_string)
            local trimmed = input_string:sub(1, math.floor(#input_string / 16) * 16)
            local padding_needed = 16 - #trimmed % 16

            if padding_needed == 16 then
                padding_needed = 0
            end

            return trimmed .. string.rep("0", padding_needed)
        end,

        strToHex = function(input_string)
            return input_string:gsub(".", function(char)
                return string.format("%02x", char:byte())
            end)
        end,

        hexToBin = function(hex_string)
            return hex_string:gsub("..", function(hex_pair)
                return string.char(tonumber(hex_pair, 16))
            end)
        end,

        bytesToHex = function(byte_array)
            local hex_string = ""

            for i = 0, #byte_array do
                if byte_array[i] then
                    hex_string = hex_string .. string.format("%02x", byte_array[i])
                end
            end

            return hex_string
        end,

        hexToBytes = function(hex_string)
            local byte_array = {}
            local index = 0

            for i = 1, #hex_string, 2 do
                byte_array[index] = tonumber(hex_string:sub(i, i + 1), 16)
                index = index + 1
            end

            return byte_array
        end
    }
end

module_loader.d = function()
    return function()
        local json = {}

        local function get_table_type(value)
            if type(value) ~= "table" then
                return type(value)
            end

            local index = 1
            for key, val in lua_pairs(value) do
                if value[index] == nil then
                    return "table"
                end
                index = index + 1
            end

            if index == 1 then
                return "table"
            end

            return "array"
        end

        local function escape_string(str)
            local unescaped = {"\\", "\"", "/", "\b", "\f", "\n", "\r", "\t"}
            local escaped = {"\\", "\"", "/", "b", "f", "n", "r", "t"}

            for i, char in ipairs(unescaped) do
                str = str:gsub(char, "\\" .. escaped[i])
            end

            return str
        end

        local function consume_token(json_string, position, expected_char, required)
            local new_position = position + #json_string:match("^%s*", position)

            if json_string:sub(new_position, new_position) ~= expected_char then
                if required then
                    lua_error("Expected " .. expected_char .. " near position " .. new_position)
                end
                return new_position, false
            end

            return new_position + 1, true
        end

        local parse_string
        parse_string = function(json_string, start_position, current_result)
            local result = current_result or ""

            if #json_string < start_position then
                lua_error("End of input found while parsing string.")
            end

            local current_char = json_string:sub(start_position, start_position)

            if current_char == "\"" then
                return result, start_position + 1
            end

            if current_char ~= "\\" then
                return parse_string(json_string, start_position + 1, result .. current_char)
            end

            local escape_map = {
                b = "\b", f = "\f", n = "\n", r = "\r", t = "\t"
            }

            local escaped_char = json_string:sub(start_position + 1, start_position + 1)

            if not escaped_char then
                lua_error("End of input found while parsing string.")
            end

            return parse_string(json_string, start_position + 2, 
                result .. (escape_map[escaped_char] or escaped_char))
        end

        local function parse_number(json_string, start_position)
            local number_string = json_string:match("^-?%d+%.?%d*[eE]?[+-]?%d*", start_position)
            local number_value = tonumber(number_string)

            if not number_value then
                lua_error("Error parsing number at position " .. start_position)
            end

            return number_value, start_position + #number_string
        end

        json.stringify = function(value, is_key)
            local parts = {}
            local value_type = get_table_type(value)

            if value_type == "array" then
                if is_key then
                    lua_error("Can't encode array as key.")
                end

                table.insert(parts, "[")

                for i, item in ipairs(value) do
                    if i > 1 then
                        table.insert(parts, ",")
                    end
                    table.insert(parts, json.stringify(item))
                end

                table.insert(parts, "]")

            elseif value_type == "table" then
                if is_key then
                    lua_error("Can't encode table as key.")
                end

                table.insert(parts, "{")

                local first = true
                for key, val in lua_pairs(value) do
                    if not first then
                        table.insert(parts, ",")
                    end
                    first = false

                    table.insert(parts, json.stringify(key, true))
                    table.insert(parts, ":")
                    table.insert(parts, json.stringify(val))
                end

                table.insert(parts, "}")

            else
                if value_type == "string" then
                    return "\"" .. escape_string(value) .. "\""
                end

                if value_type == "number" then
                    return is_key and "\"" .. lua_tostring(value) .. "\"" or lua_tostring(value)
                end

                if value_type == "boolean" then
                    return lua_tostring(value)
                end

                if value_type == "nil" then
                    return "null"
                end

                if value_type == "userdata" then
                    return "\"" .. lua_tostring(value) .. "\""
                end

                lua_error("Unjsonifiable type: " .. value_type)
            end

            return table.concat(parts)
        end

        json.null = {}

        json.parse = function(json_string, start_position, termination_char)
            local position = start_position or 1

            if #json_string < position then
                lua_error("Reached unexpected end of input.")
            end

            local current_char = json_string:sub(position, position)

            if current_char == "{" then
                local result = {}
                local expecting_comma = true
                local next_position = position + 1
                local end_position

                while true do
                    local key, key_end = json.parse(json_string, next_position, "}")
                    end_position = key_end

                    if key == nil then
                        break
                    end

                    if not expecting_comma then
                        lua_error("Comma missing between object items.")
                    end

                    local colon_pos = consume_token(json_string, end_position, ":", true)
                    local value, value_end = json.parse(json_string, colon_pos)
                    result[key] = value

                    local comma_pos, found_comma = consume_token(json_string, value_end, ",")
                    next_position = comma_pos
                    expecting_comma = found_comma
                end

                return result, end_position
            end

            if current_char == "[" then
                local result = {}
                local expecting_comma = true
                local next_position = position + 1
                local end_position

                while true do
                    local item, item_end = json.parse(json_string, next_position, "]")
                    end_position = item_end

                    if item == nil then
                        break
                    end

                    if not expecting_comma then
                        lua_error("Comma missing between array items.")
                    end

                    table.insert(result, item)

                    local comma_pos, found_comma = consume_token(json_string, item_end, ",")
                    next_position = comma_pos
                    expecting_comma = found_comma
                end

                return result, end_position
            end

            if current_char == "\"" then
                return parse_string(json_string, position + 1)
            end

            if current_char == "-" or current_char:match("%d") then
                return parse_number(json_string, position)
            end

            if current_char == termination_char then
                return nil, position + 1
            end

            for literal, value in lua_pairs({
                ["true"] = true,
                ["false"] = false,
                ["null"] = json.null
            }) do
                if json_string:sub(position, position + #literal - 1) == literal then
                    return value, position + #literal
                end
            end

            lua_error("Invalid json syntax at position " .. position)
        end

        return json
    end
end

module_loader.e = function()
    local cache_metatable = {cache = {}}
    cache_metatable.__index = cache_metatable

    cache_metatable.add = function(self, key, value, expiry_seconds)
        local expiration_time = expiry_seconds and os.time() + expiry_seconds or nil
        self.cache[key] = {value = value, expiration = expiration_time}
    end

    cache_metatable.get = function(self, key)
        local entry = self.cache[key]

        if entry then
            if entry.expiration then
                if entry.expiration < os.time() then
                    self.cache[key] = nil
                    return nil
                end
            end
            return entry.value
        end

        return nil
    end

    cache_metatable.remove = function(self, key)
        self.cache[key] = nil
    end

    cache_metatable.clear = function(self)
        self.cache = {}
    end

    cache_metatable.new = function()
        local instance = lua_setmetatable({}, cache_metatable)
        instance.cache = {}
        return instance
    end

    return cache_metatable
end

module_loader.f = function()
    return {
        generateSeed = function()
            local current_time = os.time()
            local current_clock = os.clock()
            local random_floor = math.floor(math.random() * 1000000)
            return (current_time * 1664525 + current_clock + random_floor) % 4294967296
        end,

        lcg = function(seed, count, min_val, max_val)
            local results = {}
            local current_seed = seed

            for i = 1, count do
                current_seed = (1664525 * current_seed + 1013904223) % 4294967296
                results[i] = min_val + current_seed % (max_val - min_val + 1)
            end

            return results
        end,

        sign = function(base, data)
            return base + (#data % 1000) ^ 2
        end
    }
end

module_loader.g = module_loader.d

module_loader.h = module_loader.b

module_loader.i = module_loader.c

module_loader.j = function()
    return {
        generateNonce = function()
            local nonce = ""
            for i = 1, 16 do
                nonce = nonce .. string.char(math.random(97, 122))
            end
            return nonce
        end
    }
end

module_loader.k = function()
    local lcg_module = module_loader.load("a")
    local crypto_module = obfuscated_value_wrapper(module_loader.load("b"))
    local utils_module = obfuscated_value_wrapper(module_loader.load("c"))
    local json_module = module_loader.load("d")

    return function(webhook_url, webhook_payload)
        local current_env = getfenv(2)
        local key_info = current_env["KEY_INFO"]

        local signature_rng = lcg_module.sign(
            lcg_module.lcg(lcg_module.generateSeed(), 1, 1000000, 9000000000)[1],
            webhook_url
        )

        local hash_key_1 = crypto_module.__index().HASH(16 .. signature_rng)
        local hash_key_2 = crypto_module.__index().HASH(16 .. signature_rng * 2.14)
        local combined_hash = crypto_module.__index().HASH(hash_key_1 .. hash_key_2)

        local encrypted_url = utils_module.__index().strToHex(
            buffer_tostring(
                crypto_module.__index().AES(utils_module.__index().hexToBin(combined_hash)):Encrypt(
                    json_module().stringify({
                        webhookUrl = webhook_url,
                        timestamp = os.time()
                    })
                )
            )
        )

        local encrypted_payload = utils_module.__index().strToHex(
            buffer_tostring(
                crypto_module.__index().AES(utils_module.__index().hexToBin(combined_hash)):Encrypt(
                    json_module().stringify({
                        payload = webhook_payload,
                        timestamp = os.time(),
                        key = current_env["\000\001"],
                        serviceId = current_env["\000\002"]
                    })
                )
            )
        )

        local request_data = {
            Url = "https://api.authguard.org/wb/" .. encrypted_url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                X = tostring(signature_rng)
            },
            Body = json_module().stringify({
                payload = encrypted_payload,
                secret = hash_key_1
            })
        }

        local response = http_request(request_data)

        if response.StatusCode ~= 201 then
            return nil, "Failed to send webhook: " .. tostring(response.StatusCode)
        end

        local response_json = json_module().parse(response.Body)
        return response_json
    end
end

module_loader.l = function()
    local wrap = function(value, wrap_type)
        return ("<SANITIZE:%s|%s>"):format(wrap_type, tostring(value))
    end

    return wrap
end

local AuthGuardClient = {}
AuthGuardClient.__index = AuthGuardClient

local SERVICE_ID
local FLAG_NAME
local LICENSE_KEY

AuthGuardClient.GetKeyLink = function(config)
    SERVICE_ID = config.Service or (function()
        handle_crash_error(6)
        while true do end
    end)()

    return "https://authguard.org/a/" .. SERVICE_ID
end

AuthGuardClient.GetFlag = function(config)
    SERVICE_ID = config.Service or (function()
        handle_crash_error(6)
        while true do end
    end)()

    FLAG_NAME = config.Flag or (function()
        handle_crash_error(15)
        while true do end
    end)()

    local lcg_module = module_loader.load("a")
    local crypto_module = obfuscated_value_wrapper(module_loader.load("b"))
    local utils_module = obfuscated_value_wrapper(module_loader.load("c"))
    local json_module = module_loader.load("d")
    local cache_module = module_loader.load("e")

    local cache_key = "flag:" .. SERVICE_ID .. ":" .. FLAG_NAME
    local cached_value = cache_module.get(cache_key)

    if cached_value then
        conditional_print("Using cached flag value!")
        return cached_value
    end

    local current_timestamp = os_time()
    local signature_rng = lcg_module.sign(
        lcg_module.lcg(lcg_module.generateSeed(), 1, 1000000, 9000000000)[1],
        SERVICE_ID
    )

    local hash_key_1 = crypto_module.__index().HASH(16 .. signature_rng)
    local hash_key_2 = crypto_module.__index().HASH(16 .. signature_rng * 2.14)

    local flag_payload = {
        serviceId = SERVICE_ID,
        flag = FLAG_NAME,
        timestamp = current_timestamp
    }

    local combined_hash = crypto_module.__index().HASH(hash_key_1 .. hash_key_2)

    local request_data = {
        Method = "POST",
        Url = "https://api.authguard.org/flags/payload",
        Body = json_module().stringify({
            payload = utils_module.__index().strToHex(
                buffer_tostring(
                    crypto_module.__index().AES(utils_module.__index().hexToBin(combined_hash)):Encrypt(
                        json_module().stringify(flag_payload)
                    )
                )
            ),
            secret = hash_key_1
        }),
        Headers = {
            ["content-type"] = "application/json",
            ["X-Signature"] = crypto_module.__index().HASH(os_time() .. hash_key_1),
            X = signature_rng
        }
    }

    local response = http_request(request_data)
    local response_json = json_module().parse(response.Body)

    if not response_json.success then
        conditional_print("Failed to retrieve flag!")
        return nil
    end

    if math.abs(os_time() - response_json.exp) > 60 then
        conditional_print("Flag expired!")
        return nil
    end

    local decryption_key = crypto_module.__index().HASH(
        tostring(response_json.exp * 3.14) .. SERVICE_ID .. FLAG_NAME
    )

    local decrypted_buffer = crypto_module.__index().AES(
        utils_module.__index().hexToBin(decryption_key)
    ):Decrypt(utils_module.__index().hexToBin(response_json.payload))

    local decrypted_json = json_module().parse(buffer_tostring(decrypted_buffer))

    if decrypted_json.timestamp == response_json.exp then
        conditional_print("Flag retrieved successfully!")

        if type(decrypted_json.value) ~= decrypted_json.type then
            conditional_print("Type mismatch in flag value!")
            return nil
        end

        cache_module.add(cache_key, decrypted_json.value, 60)
        return decrypted_json.value
    end

    conditional_print("Invalid flag response!")
    return nil
end

AuthGuardClient.ValidateKey = function(config)
    local key_config = config
    local security_level = key_config.SecurityLevel or 1

    key_config.Callback = key_config.Callback or function()
        handle_crash_error(7)
        while true do end
    end

    SERVICE_ID = key_config.Service or (function()
        handle_crash_error(9)
        while true do end
    end)()

    LICENSE_KEY = key_config.Key or (function()
        handle_crash_error(11)
        while true do end
    end)()

    local environment = getfenv(2)

    return lua_setmetatable({
        Validated = generate_junk_data("table"),
        APIKey = math_random(1000000, 2000000)
    }, {
        __index = function(self, key)
            handle_crash_error(12)
            while true do end
        end,

        __newindex = function(self, key)
            handle_crash_error(13)
            while true do end
        end,

        __tostring = function(self)
            handle_crash_error(14)
            while true do end
        end,

        __call = obfuscated_rotation_func(function()
            local lcg_module = module_loader.load("f")
            local json_module = module_loader.load("g")
            local crypto_module = obfuscated_value_wrapper(module_loader.load("h"))
            local utils_module = obfuscated_value_wrapper(module_loader.load("i"))
            local nonce_module = obfuscated_value_wrapper(module_loader.load("j"))

            return obfuscated_rotation_func(function()

                local signature_rng = lcg_module.sign(
                    lcg_module.lcg(lcg_module.generateSeed(), 1, 1000000, 9000000000)[1],
                    SERVICE_ID
                )

                local hash_key_1 = crypto_module.__index().HASH(16 .. signature_rng)
                local hash_key_2 = crypto_module.__index().HASH(16 .. signature_rng * 2.14)
                local combined_hash = crypto_module.__index().HASH(hash_key_1 .. hash_key_2)

                local request_nonce = nonce_module.__index().generateNonce()

                local validation_payload = {
                    hwid = get_hardware_id(),
                    key = LICENSE_KEY,
                    timestamp = os_time(),
                    serviceId = SERVICE_ID
                }

                local encrypted_payload = utils_module.__index().strToHex(
                    buffer_tostring(
                        crypto_module.__index().AES(
                            utils_module.__index().hexToBin(combined_hash)
                        ):Encrypt(json_module().stringify(validation_payload))
                    )
                )

                local request_data = {
                    Url = "https://api.authguard.org/validate/v2",
                    Method = "POST",
                    Headers = {
                        ["content-type"] = "application/json",
                        ["X-Signature"] = crypto_module.__index().HASH(
                            os_time() .. hash_key_1
                        ),
                        ["X-Nonce"] = request_nonce,
                        ["X-Executor"] = identifyexecutor and identifyexecutor() or "Unknown",
                        X = tostring(signature_rng)
                    },
                    Body = json_module().stringify({
                        payload = encrypted_payload,
                        secret = hash_key_1
                    })
                }

                local response = http_request(request_data)
                local response_json = json_module().parse(response.Body)

                if not response_json.success then
                    conditional_print("Incorrect key!")

                    if security_level == 1 then
                        return "invalid"
                    elseif security_level == 2 then
                        game.Players.LocalPlayer:Kick("Incorrect key!")
                        return "invalid"
                    elseif security_level == 3 then
                        game.Players.LocalPlayer:Kick("Incorrect key!")
                        while true do end
                    end

                    return "invalid"
                end

                if response_json.secret ~= hash_key_2 then
                    handle_crash_error(16)
                    while true do end
                end

                local decrypted_response = json_module().parse(
                    buffer_tostring(
                        crypto_module.__index().AES(
                            utils_module.__index().hexToBin(combined_hash)
                        ):Decrypt(
                            buffer_fromstring(
                                utils_module.__index().hexToBin(response_json.payload)
                            )
                        )
                    )
                )

                if decrypted_response.status ~= "success" then
                    handle_crash_error(17)
                    while true do end
                end

                local key_info = decrypted_response.keyInfo

                environment.AG_ExpiredAt = key_info.expiredAt
                environment.AG_Hwid = key_info.hwid
                environment.AG_IsPremium = key_info.isPremium
                environment.AG_DiscordId = #key_info.discordId > 0 and key_info.discordId or nil
                environment.AG_IsKeyless = key_info.keyless
                environment.AG_ExecutedCount = key_info.executedCount
                environment.AG_SecondsLeft = key_info.expiredAt - os_time()
                environment.AG_UserNote = key_info.note

                environment.LRM_ScriptName = "None"
                environment.LRM_LinkedDiscordId = environment.AG_DiscordId
                environment.LRM_TotalExecutions = environment.AG_ExecutedCount
                environment.LRM_SecondsLeft = environment.AG_SecondsLeft
                environment.LRM_UserNote = environment.AG_UserNote
                environment.LRM_IsUserPremium = environment.AG_IsPremium
                environment.LRM_ScriptVersion = "1.0.0"

                environment["\000\001"] = key_info.key
                environment["\000\002"] = decrypted_response.serviceId

                local validation_end = os_clock()
                conditional_print(
                    string_format("[AuthGuard] Validated in %f seconds", 
                        validation_end - start_time_clock)
                )

                return "validated"
            end)()
        end)
    })()
end

local send_webhook = module_loader.load("k")
local wrap_function = module_loader.load("l")

return AuthGuardClient