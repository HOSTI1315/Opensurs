type Registry__DARKLUA_TYPE_a__DARKLUA_TYPE_a = {[number]: RBXScriptConnection}
type Function__DARKLUA_TYPE_b__DARKLUA_TYPE_b = (...any) -> (any)
type Properties__DARKLUA_TYPE_c__DARKLUA_TYPE_c = {event: RBXScriptSignal, callback: Function__DARKLUA_TYPE_b__DARKLUA_TYPE_b}
type Class__DARKLUA_TYPE_d__DARKLUA_TYPE_d = {disconnect: () -> ()}
type TypeMetadata__DARKLUA_TYPE_e__DARKLUA_TYPE_e<T> = {springType: (dampingRatio:number, frequency:number, pos:number, typedat:TypeMetadata__DARKLUA_TYPE_e__DARKLUA_TYPE_e<T>, rawTarget:T) -> LinearSpring__DARKLUA_TYPE_f__DARKLUA_TYPE_f<T>, toIntermediate: (T) -> {number}, fromIntermediate: ({number}) -> T}
type LinearSpring__DARKLUA_TYPE_f__DARKLUA_TYPE_f<T> = typeof(setmetatable({}::{d: number, f: number, g: {number}, p: {number}, v: {number}, typedat: TypeMetadata__DARKLUA_TYPE_e__DARKLUA_TYPE_e<T>, rawTarget: T}, LinearSpring))
type RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g = typeof(setmetatable({}::{d: number, f: number, g: CFrame, p: CFrame, v: Vector3}, RotationSpring))
type PropertyOverride__DARKLUA_TYPE_h__DARKLUA_TYPE_h = {[string]: {class: string, get: (any) -> (), set: (any, any) -> ()}}
type Description__DARKLUA_TYPE_i__DARKLUA_TYPE_i = {className: string, [string]: any}
type Node__DARKLUA_TYPE_j__DARKLUA_TYPE_j<T=Instance> = {instance: any, components: {[string]: any}}
type Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<T=Instance> = Node__DARKLUA_TYPE_j__DARKLUA_TYPE_j<T>&T
type SessionProperties__DARKLUA_TYPE_l__DARKLUA_TYPE_l = {getKeyFunction: () -> (string), closeFunction: () -> ()}
type Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m = {__index: Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m, new: (properties:SessionProperties__DARKLUA_TYPE_l__DARKLUA_TYPE_l) -> (Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m), close: (self:Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> (), getKey: (self:Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> (string), getKeyFunction: () -> (string), closeFunction: () -> ()}
type Constants__DARKLUA_TYPE_n__DARKLUA_TYPE_n = {MAX_INTEGER: number, DISCORD_INVITE: string, DISCORD_INVITE_CODE: string}
type HitboxSettings__DARKLUA_TYPE_o__DARKLUA_TYPE_o = {AnchorPoint: Vector2, Position: UDim2, Size: UDim2, Callback: () -> ()}
type GatewaySettings__DARKLUA_TYPE_p__DARKLUA_TYPE_p = {linkvertise: string, lootlabs: string, parent: Instance, onLaunch: (session:Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> (), onValidation: (session:Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> (boolean) | nil, onClose: (() -> ()) | nil}

local __DARKLUA_BUNDLE_MODULES

__DARKLUA_BUNDLE_MODULES = {
    cache = {},
    load = function(m)
        if not __DARKLUA_BUNDLE_MODULES.cache[m] then
            __DARKLUA_BUNDLE_MODULES.cache[m] = {
                c = __DARKLUA_BUNDLE_MODULES[m](),
            }
        end

        return __DARKLUA_BUNDLE_MODULES.cache[m].c
    end,
}

do
    function __DARKLUA_BUNDLE_MODULES.a()
        local a = {
            cache = {}::any,
        }

        do
            do
                local function b()
                    return nil
                end

                function a.a(): typeof(b())
                    local c = a.cache.a

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.a = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.a(), table.unpack

                    local function e(f: Function__DARKLUA_TYPE_b__DARKLUA_TYPE_b, ...: any): Function__DARKLUA_TYPE_b__DARKLUA_TYPE_b
                        local g = {...}

                        return function(...): ()
                            f(..., d(g))

                            return
                        end
                    end

                    return table.freeze{createCall = e}
                end

                function a.b(): typeof(b())
                    local c = a.cache.b

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.b = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e: Registry__DARKLUA_TYPE_a__DARKLUA_TYPE_a = a.b(), a.a(), {}

                    local function f(g: Properties__DARKLUA_TYPE_c__DARKLUA_TYPE_c, ...: any): Class__DARKLUA_TYPE_d__DARKLUA_TYPE_d
                        local h, i = g.event, g.callback
                        local j = c.createCall(i, ...)
                        local k, l = h:Connect(j), #e + 1

                        e[l] = k

                        local function m()
                            k:Disconnect()

                            e[l] = nil
                        end

                        return {disconnect = m}
                    end
                    local function g(): ()
                        for h, i in e do
                            i:Disconnect()

                            e[h] = nil
                        end
                    end

                    return {
                        connectEvent = f,
                        terminateEvents = g,
                    }
                end

                function a.c(): typeof(b())
                    local c = a.cache.c

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.c = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r = true, 6.781684027777778E-8, 1E-4, math.rad(0.01), math.rad(0.1), 1e-5, game:GetService'RunService', math.pi, math.exp, math.sin, math.cos, math.min, math.max, math.sqrt, math.atan2, math.round

                    local function s(t: {number})
                        local u = 0

                        for v, w in t do
                            u += w ^ 2
                        end

                        return u
                    end
                    local function t(u: {number}, v: {number})
                        local w = 0

                        for x, y in u do
                            w += (v[x] - y) ^ 2
                        end

                        return w
                    end

                    local u = {}

                    do
                        u.__index = u

                        function u.new<T>(
                            v: number,
                            w: number,
                            x: T,
                            y: T,
                            z
                        )
                            local A = z.toIntermediate(x)

                            return setmetatable({
                                d = v,
                                f = w,
                                g = A,
                                p = A,
                                v = table.create(#A, 0),
                                typedat = z,
                                rawGoal = y,
                            }, u)
                        end
                        function u.setGoal<T>(v, w: T)
                            v.rawGoal = w
                            v.g = v.typedat.toIntermediate(w)
                        end
                        function u.setDampingRatio<T>(v: LinearSpring__DARKLUA_TYPE_f__DARKLUA_TYPE_f<T>, w: number)
                            v.d = w
                        end
                        function u.setFrequency<T>(v: LinearSpring__DARKLUA_TYPE_f__DARKLUA_TYPE_f<T>, w: number)
                            v.f = w
                        end
                        function u.canSleep<T>(v)
                            if s(v.v) > e then
                                return false
                            end
                            if t(v.p, v.g) > d then
                                return false
                            end

                            return true
                        end
                        function u.step<T>(v: LinearSpring__DARKLUA_TYPE_f__DARKLUA_TYPE_f<T>, w: number)
                            local x, y, z, A, B = v.d, v.f * (2 * j), v.g, v.p, v.v

                            if x == 1 then
                                local C = k(-y * w)
                                local D = w * C
                                local E, F, G = C + D * y, C - D * y, D * y * y

                                for H = 1, #A do
                                    local I = A[H] - z[H]

                                    A[H] = I * E + B[H] * D + z[H]
                                    B[H] = B[H] * F - I * G
                                end
                            elseif x < 1 then
                                local C, D = k(-x * y * w), p(1 - x * x)
                                local E, F, G = m(w * y * D), (l(w * y * D))

                                if D > h then
                                    G = F / D
                                else
                                    local H = w * y

                                    G = H + ((H * H) * (D * D) * (D * D) / 20 - D * D) * (H * H * H) / 6
                                end

                                local H

                                if y * D > h then
                                    H = F / (y * D)
                                else
                                    local I = y * D

                                    H = w + ((w * w) * (I * I) * (I * I) / 20 - I * I) * (w * w * w) / 6
                                end

                                for I = 1, #A do
                                    local J = A[I] - z[I]

                                    A[I] = (J * (E + G * x) + B[I] * H) * C + z[I]
                                    B[I] = (B[I] * (E - G * x) - J * (G * y)) * C
                                end
                            else
                                local C = p(x * x - 1)
                                local D, E = -y * (x + C), -y * (x - C)
                                local F, G = k(D * w), k(E * w)

                                for H = 1, #A do
                                    local I = A[H] - z[H]
                                    local J = (B[H] - I * D) / (2 * y * C)
                                    local K = F * (I - J)

                                    A[H] = K + J * G + z[H]
                                    B[H] = K * D + J * G * E
                                end
                            end

                            return v.typedat.fromIntermediate(v.p)
                        end
                    end

                    local v = {}

                    do
                        v.__index = v

                        function v.new(
                            w: number,
                            x: number,
                            y: CFrame,
                            z: CFrame
                        )
                            return setmetatable({
                                d = w,
                                f = x,
                                g = z:Orthonormalize(),
                                p = y:Orthonormalize(),
                                v = Vector3.zero,
                            }, v)
                        end
                        function v.setGoal(w: RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g, x: CFrame)
                            w.g = x:Orthonormalize()
                        end
                        function v.setDampingRatio(w: RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g, x: number)
                            w.d = x
                        end
                        function v.setFrequency(w: RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g, x: number)
                            w.f = x
                        end

                        local function w(x: Vector3, y: Vector3)
                            return x.X * y.X + x.Y * y.Y + x.Z * y.Z
                        end
                        local function x(y: CFrame, z: CFrame)
                            local A, B, C = w(y.XVector, z.XVector), w(y.YVector, z.YVector), w(y.ZVector, z.ZVector)
                            local D = A + B + C

                            return D > 1 + 2 * m(f)
                        end
                        local function y(z: CFrame, A: CFrame)
                            local B, C, D = w(z.XVector, A.XVector), w(z.YVector, A.YVector), w(z.ZVector, A.ZVector)
                            local E = B + C + D - 1

                            return q(p(o(0, 1 - E * E * 0.25)), E * 0.5)
                        end
                        local function z(A: Vector3, B: number)
                            local C, D, E, F, G = m(B), l(B), A.X, A.Y, A.Z
                            local H, I, J = E * F * (1 - C), F * G * (1 - C), G * E * (1 - C)
                            local K, L, M = Vector3.new(E * E * (1 - C) + C, H + G * D, J - F * D), Vector3.new(H - G * D, F * F * (1 - C) + C, I + E * D), Vector3.new(J + F * D, I - E * D, G * G * (1 - C) + C)

                            return CFrame.fromMatrix(Vector3.zero, K, L, M):Orthonormalize()
                        end
                        local function A(B: Vector3, C: CFrame)
                            local D, E = CFrame.identity, B.Magnitude

                            if E > 1e-6 then
                                D = z(B.Unit, E)
                            end

                            return D * C
                        end
                        local function B(C: CFrame, D: CFrame)
                            local E, F = (C * D:Inverse()):ToAxisAngle(), y(C, D)

                            return E.Unit * F
                        end

                        function v.canSleep(C: RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g)
                            local D, E = x(C.p, C.g), C.v.Magnitude < g

                            return D and E
                        end
                        function v.step(C: RotationSpring__DARKLUA_TYPE_g__DARKLUA_TYPE_g, D: number): CFrame
                            local E, F, G, H, I = C.d, C.f * (2 * j), C.g, C.p, C.v
                            local J, K, L: CFrame, M: Vector3 = B(H, G), (k(-E * F * D))

                            if E == 1 then
                                L = A((J * (1 + F * D) + I * D) * K, G)
                                M = (I * (1 - D * F) - J * (D * F * F)) * K
                            elseif E < 1 then
                                local N = p(1 - E * E)
                                local O, P = m(D * F * N), l(D * F * N)
                                local Q, R = P / (F * N), P / N

                                L = A((J * (O + R * E) + I * Q) * K, G)
                                M = (I * (O - R * E) - J * (R * F)) * K
                            else
                                local N = p(E * E - 1)
                                local O, P = -F * (E + N), -F * (E - N)
                                local Q = (I - J * O) / (2 * F * N)
                                local R = J - Q
                                local S, T = R * k(O * D), Q * k(P * D)

                                L = A(S + T, G)
                                M = S * O + T * P
                            end

                            C.p = L
                            C.v = M

                            return L
                        end
                    end

                    local w, x = {
                        springType = u.new,
                        toIntermediate = function(w)
                            return {
                                w.X,
                                w.Y,
                                w.Z,
                            }
                        end,
                        fromIntermediate = function(w: {number})
                            return Vector3.new(w[1], w[2], w[3])
                        end,
                    }, {}

                    do
                        x.__index = x

                        function x.new(
                            y: number,
                            z: number,
                            A: CFrame,
                            B: CFrame,
                            C: any
                        )
                            return setmetatable({
                                rawGoal = B,
                                _position = u.new(y, z, A.Position, B.Position, w),
                                _rotation = v.new(y, z, A.Rotation, B.Rotation),
                            }, x)
                        end
                        function x:setGoal(y: CFrame)
                            self.rawGoal = y

                            self._position:setGoal(y.Position)
                            self._rotation:setGoal(y.Rotation)
                        end
                        function x:setDampingRatio(y: number)
                            self._position.d = y
                            self._rotation.d = y
                        end
                        function x:setFrequency(y: number)
                            self._position.f = y
                            self._rotation.f = y
                        end
                        function x:canSleep()
                            return self._position:canSleep() and self._rotation:canSleep()
                        end
                        function x:step(y): CFrame
                            local z: Vector3, A: CFrame = self._position:step(y), self._rotation:step(y)

                            return A + z
                        end
                    end

                    local y, z

                    do
                        local function A(B)
                            return B < 0.0404482362771076 and B / 12.92 or 0.87941546140213 * (B + 0.055) ^ 2.4
                        end
                        local function B(C)
                            return C < 3.1306684424999998e-3 and 12.92 * C or 1.055 * C ^ (0.4166666666666667) - 0.055
                        end

                        function y(C: Color3): {number}
                            local D, E, F = C.R, C.G, C.B

                            D = A(D)
                            E = A(E)
                            F = A(F)

                            local G, H, I = 0.9257063972951867 * D - 0.8333736323779866 * E - 0.09209820666085898 * F, 0.2125862307855956 * D + 0.7151703037034108 * E + 0.0722004986433362 * F, 3.6590806972265884 * D + 11.442689580057424 * E + 4.114991502426484 * F
                            local J, K, L = H > 0.008856451679035631 and 116 * H ^ (0.3333333333333333) - 16 or 903.296296296296 * H

                            if I > 1e-14 then
                                K = J * G / I
                                L = J * (9 * H / I - 0.46832)
                            else
                                K = -0.19783 * J
                                L = -0.46832 * J
                            end

                            return {J, K, L}
                        end
                        function z(C: {number}): Color3
                            local D = C[1]

                            if D < 0.0197955 then
                                return Color3.new(0, 0, 0)
                            end

                            local E, F, G = C[2] / D + 0.19783, C[3] / D + 0.46832, (D + 16) / 116

                            G = G > 0.20689655172413793 and G * G * G or 0.12841854934601665 * G - 0.01771290335807126

                            local H, I = G * E / F, G * ((3 - 0.75 * E) / F - 5)
                            local J, K, L = 7.2914074 * H - 1.537208 * G - 0.4986286 * I,
-2.180094 * H + 1.8757561 * G + 0.0415175 * I, 0.1253477 * H - 0.2040211 * G + 1.0569959 * I

                            if J < 0 and J < K and J < L then
                                J, K, L = 0, K - J, L - J
                            elseif K < 0 and K < L then
                                J, K, L = J - K, 0, L - K
                            elseif L < 0 then
                                J, K, L = J - L, K - L, 0
                            end

                            return Color3.new(n(B(J), 1), n(B(K), 1), n(B(L), 1))
                        end
                    end

                    local A, B: PropertyOverride__DARKLUA_TYPE_h__DARKLUA_TYPE_h = {
                        boolean = {
                            springType = u.new,
                            toIntermediate = function(A)
                                return {
                                    A and 1 or 0,
                                }
                            end,
                            fromIntermediate = function(A)
                                return A[1] >= 0.5
                            end,
                        },
                        number = {
                            springType = u.new,
                            toIntermediate = function(A)
                                return {A}
                            end,
                            fromIntermediate = function(A)
                                return A[1]
                            end,
                        },
                        NumberRange = {
                            springType = u.new,
                            toIntermediate = function(A)
                                return {
                                    A.Min,
                                    A.Max,
                                }
                            end,
                            fromIntermediate = function(A)
                                return NumberRange.new(A[1], A[2])
                            end,
                        },
                        UDim = {
                            springType = u.new,
                            toIntermediate = function(A)
                                return {
                                    A.Scale,
                                    A.Offset,
                                }
                            end,
                            fromIntermediate = function(A: {number})
                                return UDim.new(A[1], r(A[2]))
                            end,
                        },
                        UDim2 = {
                            springType = u.new,
                            toIntermediate = function(A)
                                local B, C = A.X, A.Y

                                return {
                                    B.Scale,
                                    B.Offset,
                                    C.Scale,
                                    C.Offset,
                                }
                            end,
                            fromIntermediate = function(A: {number})
                                return UDim2.new(A[1], r(A[2]), A[3], r(A[4]))
                            end,
                        },
                        Vector2 = {
                            springType = u.new,
                            toIntermediate = function(A)
                                return {
                                    A.X,
                                    A.Y,
                                }
                            end,
                            fromIntermediate = function(A: {number})
                                return Vector2.new(A[1], A[2])
                            end,
                        },
                        Vector3 = w,
                        Color3 = {
                            springType = u.new,
                            toIntermediate = y,
                            fromIntermediate = z,
                        },
                        ColorSequence = {
                            springType = u.new,
                            toIntermediate = function(A)
                                local B = A.Keypoints
                                local C, D = y(B[1].Value), y(B[#B].Value)

                                return {
                                    C[1],
                                    C[2],
                                    C[3],
                                    D[1],
                                    D[2],
                                    D[3],
                                }
                            end,
                            fromIntermediate = function(A: {})
                                return ColorSequence.new(z{
                                    A[1],
                                    A[2],
                                    A[3],
                                }, z{
                                    A[4],
                                    A[5],
                                    A[6],
                                })
                            end,
                        },
                        CFrame = {
                            springType = x.new,
                            toIntermediate = error,
                            fromIntermediate = error,
                        },
                    }, {
                        Pivot = {
                            class = 'PVInstance',
                            get = function(A: PVInstance)
                                return A:GetPivot()
                            end,
                            set = function(A: PVInstance, B: CFrame)
                                A:PivotTo(B)
                            end,
                        },
                        Scale = {
                            class = 'Model',
                            get = function(A: Model)
                                return A:GetScale()
                            end,
                            set = function(A: Model, B: number)
                                local C, D = 1.4020000000000001e-45, 16777216

                                B = math.clamp(B, C, D)

                                A:ScaleTo(B)
                            end,
                        },
                    }

                    local function C(D: Instance, E: string): any
                        local F = B[E]

                        if F and D:IsA(F.class) then
                            return F.get(D)
                        else
                            return (D::any)[E]
                        end
                    end
                    local function D(E: Instance, F: string, G: unknown)
                        local H = B[F]

                        if H and E:IsA(H.class) then
                            H.set(E, G)
                        else
                            (E::any)[F] = G
                        end
                    end

                    local E: {[Instance]: {[string]: any}}, F: {[Instance]: {[string]: any}}, G: {[Instance]: {() -> ()}} = {}, {}, {}

                    local function H(I: typeof(E), J: number)
                        for K, L in I do
                            for M, N in L do
                                if N:canSleep() then
                                    L[M] = nil

                                    D(K, M, N.rawGoal)
                                else
                                    D(K, M, N:step(J))
                                end
                            end

                            if not next(L) then
                                I[K] = nil

                                local M = G[K]

                                if M then
                                    G[K] = nil

                                    for N, O in M do
                                        task.spawn(O)
                                    end
                                end
                            end
                        end
                    end

                    i.PreSimulation:Connect(function(I)
                        H(E, I)
                    end)
                    i.PostSimulation:Connect(function(I)
                        H(F, I)
                    end)

                    local function I(
                        J: number,
                        K: string,
                        L: string,
                        M: unknown
                    )
                        if not L:find(typeof(M)) then
                            error(string.format('bad argument #%s to %s (%s expected, got %s)', tostring(J), tostring(K), tostring(L), tostring(typeof(M))), 3)
                        end
                    end

                    local J = {}

                    function J.target(
                        K: Instance,
                        L: number,
                        M: number,
                        N: {[string]: any}
                    )
                        if c then
                            I(1, 'spr.target', 'Instance', K)
                            I(2, 'spr.target', 'number', L)
                            I(3, 'spr.target', 'number', M)
                            I(4, 'spr.target', 'table', N)
                        end
                        if L ~= L or L < 0 then
                            error(('expected damping ratio >= 0; got %.2f'):format(L), 2)
                        end
                        if M ~= M or M < 0 then
                            error(('expected undamped frequency >= 0; got %.2f'):format(M), 2)
                        end

                        local O: {[Instance]: {[string]: any}}

                        if K:IsA'Camera' then
                            O = F
                        else
                            O = E
                        end

                        local P = O[K]

                        if not P then
                            P = {}
                            O[K] = P
                        end

                        for Q, R in N do
                            local S = C(K, Q)

                            if c and typeof(R) ~= typeof(S) then
                                error(string.format('bad property %s to spr.target (%s expected, got %s)', tostring(Q), tostring(typeof(S)), tostring(typeof(R))), 2)
                            end
                            if M == math.huge then
                                D(K, Q, R)

                                P[Q] = nil

                                continue
                            end

                            local T = P[Q]

                            if not T then
                                local U = A[typeof(R)]

                                if not U then
                                    error('unsupported type: ' .. typeof(R), 2)
                                end

                                T = U.springType(L, M, S, R, U)
                                P[Q] = T
                            end

                            T:setGoal(R)
                            T:setDampingRatio(L)
                            T:setFrequency(M)
                        end

                        if not next(P) then
                            O[K] = nil
                        end
                    end
                    function J.stop(K: Instance, L: string?)
                        if c then
                            I(1, 'spr.stop', 'Instance', K)
                            I(2, 'spr.stop', 'string|nil', L)
                        end
                        if L then
                            local M = E[K] or F[K]

                            if M then
                                M[L] = nil
                            end
                        else
                            E[K] = nil
                            F[K] = nil
                        end
                    end
                    function J.completed(K: Instance, L: () -> ())
                        if c then
                            I(1, 'spr.completed', 'Instance', K)
                            I(2, 'spr.completed', 'function', L)
                        end

                        local M = G[K]

                        if M then
                            table.insert(M, L)
                        else
                            G[K] = {L}
                        end
                    end

                    return table.freeze(J)
                end

                function a.d(): typeof(b())
                    local c = a.cache.d

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.d = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    return nil
                end

                function a.e(): typeof(b())
                    local c = a.cache.e

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.e = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    a.e()

                    local function c(d: Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<Instance>?, e: string): Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<Instance>?
                        if d == nil then
                            return
                        end

                        local f = d.components

                        if f == nil then
                            return
                        end

                        local g = f[e]

                        if g == nil then
                            return
                        end

                        return g
                    end
                    local function d<T>(e: Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<Instance>?, f: string): T?
                        local g = c(e, f)

                        if g == nil then
                            return
                        end

                        return g.instance::T
                    end

                    return table.freeze{
                        getComponent = c,
                        getObject = d,
                    }
                end

                function a.f(): typeof(b())
                    local c = a.cache.f

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.f = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = Instance.new, a.e()

                    local function e(f: Description__DARKLUA_TYPE_i__DARKLUA_TYPE_i, g: Instance?): Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<Instance>?
                        if f == nil then
                            return
                        end

                        local h, i = {}, f.Class

                        if i == nil then
                            return
                        end

                        local j = c(i)::any

                        if not j then
                            return
                        end

                        for k, l in f do
                            if k == 'Class' then
                                continue
                            end
                            if k ~= 'Components' then
                                j[k] = l
                            else
                                for m, n in l do
                                    local o = e(n, j)

                                    h[m] = o
                                end
                            end
                        end

                        if g ~= nil then
                            j.Parent = g
                        end

                        local k = {
                            instance = j,
                            components = h,
                        }::Node__DARKLUA_TYPE_j__DARKLUA_TYPE_j<Instance>

                        return setmetatable(k, {__index = Instance})::Components__DARKLUA_TYPE_k__DARKLUA_TYPE_k<Instance>
                    end

                    return table.freeze{createFromStyle = e}
                end

                function a.g(): typeof(b())
                    local c = a.cache.g

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.g = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    return nil
                end

                function a.h(): typeof(b())
                    local c = a.cache.h

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.h = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.h(), {}::Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m

                    d.__index = d

                    function d.new(e: SessionProperties__DARKLUA_TYPE_l__DARKLUA_TYPE_l): Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m
                        local f = {
                            getKeyFunction = e.getKeyFunction,
                            closeFunction = e.closeFunction,
                        }

                        setmetatable(f, d)

                        return f::any
                    end
                    function d:close()
                        local e = self.closeFunction

                        e()
                    end
                    function d:getKey()
                        local e = self.getKeyFunction
                        local f = e()

                        return f
                    end

                    return d
                end

                function a.i(): typeof(b())
                    local c = a.cache.i

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.i = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e = 'rbxasset://fonts/families/Montserrat.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal

                    return table.freeze{
                        MONTSERRAT_SEMIBOLD = Font.new(c, d, e),
                    }
                end

                function a.j(): typeof(b())
                    local c = a.cache.j

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.j = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    return nil
                end

                function a.k(): typeof(b())
                    local c = a.cache.k

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.k = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    a.k()

                    return table.freeze({
                        MAX_INTEGER = 2147483647,
                        DISCORD_INVITE = 'https://discord.gg/QyNghGRmH3',
                        DISCORD_INVITE_CODE = 'QyNghGRmH3',
                    }::Constants__DARKLUA_TYPE_n__DARKLUA_TYPE_n)
                end

                function a.l(): typeof(b())
                    local c = a.cache.l

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.l = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c = Color3.fromRGB

                    return table.freeze{
                        Black = c(0, 0, 0),
                        Night = c(7, 7, 7),
                        Deep = c(12, 12, 12),
                        Slate = c(24, 24, 24),
                        Border = c(27, 27, 27),
                        Divider = c(28, 28, 28),
                        Cloud = c(235, 235, 235),
                        White = c(255, 255, 255),
                        Azure = c(30, 86, 216),
                        Usedcvnt = c(113, 35, 188),
                        Amber = c(188, 111, 35),
                        Mist = c(205, 225, 255),
                        Text = c(235, 235, 235),
                        Accent = c(210, 10, 46),
                    }
                end

                function a.m(): typeof(b())
                    local c = a.cache.m

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.m = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    return table.freeze{
                        headerCross = 'rbxassetid://138587803745667',
                        headerPseudoShader = 'rbxassetid://79912556398061',
                        buttonPseudoShader = 'rbxassetid://134622165963267',
                        play = 'rbxassetid://82185954191052',
                        link = 'rbxassetid://124316681458847',
                        key = 'rbxassetid://127769833326655',
                        earth = 'rbxassetid://116793177414727',
                    }
                end

                function a.n(): typeof(b())
                    local c = a.cache.n

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.n = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e, f, g = a.e(), a.j(), a.l(), a.m(), a.n()
                    local h, i, j, k, l, m, n = d.MONTSERRAT_SEMIBOLD, e.MAX_INTEGER, Vector2.new, UDim2.fromScale, UDim.new, UDim2.fromOffset, UDim2.new

                    return table.freeze({
                        GatewayOverlay = {
                            Class = 'ScreenGui',
                            Name = 'Gateway',
                            SafeAreaCompatibility = Enum.SafeAreaCompatibility.FullscreenExtension,
                            ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
                            Archivable = false,
                            ResetOnSpawn = false,
                            AutoLocalize = false,
                            DisplayOrder = i,
                        },
                        MainContainer = {
                            Class = 'Frame',
                            AnchorPoint = j(0.5, 0.5),
                            BackgroundColor3 = f.Night,
                            Position = k(0.5, 1.5),
                            Size = k(0.5, 0.5),
                            Components = {
                                UIAspectRatioConstraint = {
                                    Class = 'UIAspectRatioConstraint',
                                    AspectRatio = 1.976,
                                },
                                UICorner = {
                                    Class = 'UICorner',
                                    CornerRadius = l(0.07, 0),
                                },
                                UISizeConstraint = {
                                    Class = 'UISizeConstraint',
                                    MaxSize = j(415, 210),
                                    MinSize = j(415, 210),
                                },
                                UIStroke = {
                                    Class = 'UIStroke',
                                    Color = f.Night,
                                    StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                                    Thickness = 0.04,
                                    Transparency = 0.4,
                                },
                                Header = {
                                    Class = 'Frame',
                                    AnchorPoint = j(0.5, 0),
                                    BackgroundTransparency = 1,
                                    Position = k(0.5, 0),
                                    Size = k(1, 0.232),
                                    ClipsDescendants = true,
                                    Components = {
                                        Divider = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0, 1),
                                            BackgroundColor3 = f.Divider,
                                            BorderSizePixel = 0,
                                            Position = k(0, 1),
                                            Size = n(1, 0, 0, 1),
                                        },
                                        Primary = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 0.5),
                                            BackgroundTransparency = 1,
                                            Position = k(0.5, 0.5),
                                            Size = k(1, 1),
                                            Components = {
                                                UIListLayout = {
                                                    Class = 'UIListLayout',
                                                    Padding = l(0, 15),
                                                    FillDirection = Enum.FillDirection.Horizontal,
                                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                                    HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                    ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                                },
                                                UIPadding = {
                                                    Class = 'UIPadding',
                                                    PaddingLeft = l(0, 15),
                                                    PaddingRight = l(0, 15),
                                                },
                                                CrossImage = {
                                                    Class = 'ImageLabel',
                                                    AnchorPoint = j(0, 0.5),
                                                    BackgroundTransparency = 1,
                                                    LayoutOrder = 1,
                                                    Size = m(18, 18),
                                                    Image = g.headerCross,
                                                },
                                                Title = {
                                                    Class = 'TextLabel',
                                                    AnchorPoint = j(0, 0.5),
                                                    BackgroundTransparency = 1,
                                                    Interactable = false,
                                                    Size = k(0.915, 0.44),
                                                    FontFace = h,
                                                    Text = 'Native',
                                                    TextColor3 = f.Accent,
                                                    TextScaled = true,
                                                    TextXAlignment = Enum.TextXAlignment.Left,
                                                },
                                            },
                                        },
                                        PseudoShader = {
                                            Class = 'ImageLabel',
                                            AnchorPoint = j(0.5, 0.5),
                                            BackgroundTransparency = 1,
                                            Interactable = false,
                                            Position = k(0.5, 0.5),
                                            Size = k(1, 1),
                                            Image = g.headerPseudoShader,
                                            ImageColor3 = f.Accent,
                                            ImageTransparency = 0.5,
                                        },
                                    },
                                },
                                InteractionArea = {
                                    Class = 'Frame',
                                    AnchorPoint = j(0.5, 1),
                                    BackgroundTransparency = 1,
                                    Position = k(0.5, 1),
                                    Size = k(1, 0.778),
                                    Components = {
                                        UIPadding = {
                                            Class = 'UIPadding',
                                            PaddingBottom = l(0, 10),
                                            PaddingLeft = l(0, 10),
                                            PaddingRight = l(0, 10),
                                            PaddingTop = l(0, 10),
                                        },
                                        LaunchButtonContainer = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 0.5),
                                            BackgroundColor3 = f.Deep,
                                            BorderSizePixel = 0,
                                            Position = k(0.5, 0.5),
                                            Size = n(1, 0, 0, 40),
                                            Components = {
                                                UICorner = {
                                                    Class = 'UICorner',
                                                    CornerRadius = l(0.27, 0),
                                                },
                                                UIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                                    Color = f.Divider,
                                                    Thickness = 1.5,
                                                    Transparency = 0.14,
                                                },
                                                Primary = {
                                                    Class = 'Frame',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundTransparency = 1,
                                                    Position = k(0.5, 0.5),
                                                    Size = k(1, 1),
                                                    Components = {
                                                        UIListLayout = {
                                                            Class = 'UIListLayout',
                                                            FillDirection = Enum.FillDirection.Horizontal,
                                                            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                            ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                            Padding = l(0, 15),
                                                            SortOrder = Enum.SortOrder.LayoutOrder,
                                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                                        },
                                                        UIPadding = {
                                                            Class = 'UIPadding',
                                                            PaddingLeft = l(0, 13),
                                                            PaddingRight = l(0, 34),
                                                        },
                                                        Icon = {
                                                            Class = 'ImageLabel',
                                                            AnchorPoint = j(1, 0.5),
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            Image = g.play,
                                                            Position = k(0, 0.5),
                                                            Size = m(18, 18),
                                                        },
                                                        Text = {
                                                            Class = 'TextLabel',
                                                            BackgroundTransparency = 1,
                                                            FontFace = h,
                                                            LayoutOrder = 1,
                                                            Position = k(0.108, 0),
                                                            Size = k(1, 1),
                                                            Text = 'Launch',
                                                            TextColor3 = Color3.fromRGB(235, 235, 235),
                                                            TextSize = 16,
                                                            TextXAlignment = Enum.TextXAlignment.Left,
                                                        },
                                                    },
                                                },
                                                PseudoShader = {
                                                    Class = 'ImageLabel',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundTransparency = 1,
                                                    Image = g.buttonPseudoShader,
                                                    ImageColor3 = f.Azure,
                                                    Position = k(0.5, 0.5),
                                                    ScaleType = Enum.ScaleType.Crop,
                                                    Size = k(1, 1),
                                                },
                                            },
                                        },
                                        LinkvertiseButtonContainer = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 1),
                                            BackgroundColor3 = f.Deep,
                                            BorderSizePixel = 0,
                                            Position = k(0.244, 1),
                                            Size = n(0.486, 0, 0, 40),
                                            Components = {
                                                UICorner = {
                                                    Class = 'UICorner',
                                                    CornerRadius = l(0.27, 0),
                                                },
                                                UIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                                    Color = f.Divider,
                                                    Thickness = 1.5,
                                                    Transparency = 0.14,
                                                },
                                                Primary = {
                                                    Class = 'Frame',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                                    BackgroundTransparency = 1,
                                                    BorderSizePixel = 0,
                                                    Position = k(0.5, 0.5),
                                                    Size = k(1, 1),
                                                    Components = {
                                                        UIListLayout = {
                                                            Class = 'UIListLayout',
                                                            FillDirection = Enum.FillDirection.Horizontal,
                                                            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                            ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                            Padding = l(0, 15),
                                                            SortOrder = Enum.SortOrder.LayoutOrder,
                                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                                        },
                                                        UIPadding = {
                                                            Class = 'UIPadding',
                                                            PaddingLeft = l(0, 13),
                                                            PaddingRight = l(0, 34),
                                                        },
                                                        Icon = {
                                                            Class = 'ImageLabel',
                                                            AnchorPoint = j(1, 0.5),
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            Image = g.link,
                                                            Position = k(0, 0.5),
                                                            Size = m(18, 18),
                                                        },
                                                        Text = {
                                                            Class = 'TextLabel',
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            ClipsDescendants = true,
                                                            FontFace = h,
                                                            LayoutOrder = 1,
                                                            Position = k(0.175, 0),
                                                            Size = k(1, 1),
                                                            Text = 'Linkvertise',
                                                            TextColor3 = f.Text,
                                                            TextSize = 16,
                                                            TextXAlignment = Enum.TextXAlignment.Left,
                                                        },
                                                    },
                                                },
                                                PseudoShader = {
                                                    Class = 'ImageLabel',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundTransparency = 1,
                                                    BorderSizePixel = 0,
                                                    Image = g.buttonPseudoShader,
                                                    ImageColor3 = f.Amber,
                                                    Position = k(0.5, 0.5),
                                                    ScaleType = Enum.ScaleType.Crop,
                                                    Size = k(1, 1),
                                                },
                                            },
                                        },
                                        LootlabsButtonContainer = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 1),
                                            BackgroundColor3 = f.Deep,
                                            BorderSizePixel = 0,
                                            Position = k(0.755, 1),
                                            Size = n(0.487, 0, 0, 40),
                                            Components = {
                                                UICorner = {
                                                    Class = 'UICorner',
                                                    CornerRadius = l(0.27, 0),
                                                },
                                                UIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                                    Color = f.Divider,
                                                    Thickness = 1.5,
                                                    Transparency = 0.14,
                                                },
                                                Primary = {
                                                    Class = 'Frame',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                                    BackgroundTransparency = 1,
                                                    BorderSizePixel = 0,
                                                    Position = k(0.5, 0.5),
                                                    Size = k(1, 1),
                                                    Components = {
                                                        UIListLayout = {
                                                            Class = 'UIListLayout',
                                                            FillDirection = Enum.FillDirection.Horizontal,
                                                            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                            ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                            Padding = l(0, 15),
                                                            SortOrder = Enum.SortOrder.LayoutOrder,
                                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                                        },
                                                        UIPadding = {
                                                            Class = 'UIPadding',
                                                            PaddingLeft = l(0, 13),
                                                            PaddingRight = l(0, 34),
                                                        },
                                                        Icon = {
                                                            Class = 'ImageLabel',
                                                            AnchorPoint = j(1, 0.5),
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            Image = g.link,
                                                            Position = k(0, 0.5),
                                                            Size = m(18, 18),
                                                        },
                                                        Text = {
                                                            Class = 'TextLabel',
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            ClipsDescendants = true,
                                                            FontFace = h,
                                                            LayoutOrder = 1,
                                                            Position = k(0.175, 0),
                                                            Size = k(1, 1),
                                                            Text = 'Lootlabs',
                                                            TextColor3 = f.Text,
                                                            TextSize = 16,
                                                            TextXAlignment = Enum.TextXAlignment.Left,
                                                        },
                                                    },
                                                },
                                                PseudoShader = {
                                                    Class = 'ImageLabel',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundTransparency = 1,
                                                    BorderSizePixel = 0,
                                                    Image = g.buttonPseudoShader,
                                                    ImageColor3 = f.Usedcvnt,
                                                    Position = k(0.5, 0.5),
                                                    ScaleType = Enum.ScaleType.Crop,
                                                    Size = k(1, 1),
                                                },
                                            },
                                        },
                                        KeyBoxContainer = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 0),
                                            BackgroundTransparency = 1,
                                            Position = k(0.327, 0),
                                            Size = n(0.653, 0, 0, 40),
                                            Components = {
                                                UICorner = {
                                                    Class = 'UICorner',
                                                    CornerRadius = l(0.27, 0),
                                                },
                                                UIListLayout = {
                                                    Class = 'UIListLayout',
                                                    Padding = l(0, 15),
                                                    FillDirection = Enum.FillDirection.Horizontal,
                                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                                    HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                    ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                                },
                                                UIPadding = {
                                                    Class = 'UIPadding',
                                                    PaddingLeft = l(0, 13),
                                                    PaddingRight = l(0, 34),
                                                },
                                                UIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                                    Color = f.Divider,
                                                    Thickness = 1.5,
                                                    Transparency = 0.14,
                                                },
                                                FeedbackUIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderOffset = l(0, 1),
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Outer,
                                                    Color = f.Accent,
                                                    Thickness = 0.95,
                                                    Transparency = 1,
                                                    ZIndex = 0,
                                                },
                                                TextBox = {
                                                    Class = 'TextBox',
                                                    AnchorPoint = j(0.5, 0),
                                                    BackgroundTransparency = 1,
                                                    ClearTextOnFocus = false,
                                                    LayoutOrder = 1,
                                                    Size = k(1, 1),
                                                    ClipsDescendants = true,
                                                    FontFace = h,
                                                    PlaceholderText = 'Enter your key',
                                                    Text = '',
                                                    TextColor3 = f.Text,
                                                    TextSize = 16,
                                                    TextXAlignment = Enum.TextXAlignment.Left,
                                                },
                                                IconContainer = {
                                                    Class = 'Frame',
                                                    AnchorPoint = j(1, 0.5),
                                                    BackgroundTransparency = 1,
                                                    Size = m(18, 18),
                                                    Components = {
                                                        Icon = {
                                                            Class = 'ImageLabel',
                                                            BackgroundTransparency = 1,
                                                            Size = m(18, 18),
                                                            Image = g.key,
                                                        },
                                                    },
                                                },
                                            },
                                        },
                                        DiscordButtonContainer = {
                                            Class = 'Frame',
                                            AnchorPoint = j(0.5, 0),
                                            BackgroundColor3 = f.Deep,
                                            BorderColor3 = Color3.fromRGB(0, 0, 0),
                                            BorderSizePixel = 0,
                                            Position = k(0.837, 0),
                                            Size = n(0.318, 0, 0, 40),
                                            Components = {
                                                UICorner = {
                                                    Class = 'UICorner',
                                                    CornerRadius = l(0.27, 0),
                                                },
                                                UIStroke = {
                                                    Class = 'UIStroke',
                                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                                                    BorderStrokePosition = Enum.BorderStrokePosition.Center,
                                                    Color = f.Divider,
                                                    Thickness = 1.5,
                                                    Transparency = 0.14,
                                                },
                                                Primary = {
                                                    Class = 'Frame',
                                                    AnchorPoint = j(0.5, 0.5),
                                                    BackgroundTransparency = 1,
                                                    BorderSizePixel = 0,
                                                    Position = k(0.5, 0.5),
                                                    Size = k(1, 1),
                                                    Components = {
                                                        UIListLayout = {
                                                            Class = 'UIListLayout',
                                                            FillDirection = Enum.FillDirection.Horizontal,
                                                            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                                                            ItemLineAlignment = Enum.ItemLineAlignment.Center,
                                                            Padding = l(0, 15),
                                                            SortOrder = Enum.SortOrder.LayoutOrder,
                                                            VerticalAlignment = Enum.VerticalAlignment.Center,
                                                        },
                                                        UIPadding = {
                                                            Class = 'UIPadding',
                                                            PaddingLeft = l(0, 13),
                                                            PaddingRight = l(0, 34),
                                                        },
                                                        Icon = {
                                                            Class = 'ImageLabel',
                                                            AnchorPoint = j(1, 0.5),
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            Image = g.earth,
                                                            Position = k(0, 0.5),
                                                            Size = m(18, 18),
                                                        },
                                                        Text = {
                                                            Class = 'TextLabel',
                                                            BackgroundTransparency = 1,
                                                            BorderSizePixel = 0,
                                                            FontFace = h,
                                                            LayoutOrder = 1,
                                                            Position = k(1.26, 0.725),
                                                            Size = k(1, 1),
                                                            Text = 'Discord',
                                                            TextColor3 = f.Text,
                                                            TextSize = 16,
                                                            TextXAlignment = Enum.TextXAlignment.Left,
                                                        },
                                                    },
                                                },
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    }::Description__DARKLUA_TYPE_i__DARKLUA_TYPE_i)
                end

                function a.o(): typeof(b())
                    local c = a.cache.o

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.o = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    return nil
                end

                function a.p(): typeof(b())
                    local c = a.cache.p

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.p = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e, f = a.c(), a.l(), a.p(), Instance.new

                    local function g(h, i: HitboxSettings__DARKLUA_TYPE_o__DARKLUA_TYPE_o)
                        local j, k, l, m = i.AnchorPoint, i.Position, i.Size, f'TextButton'

                        m.BackgroundTransparency = 1
                        m.AnchorPoint = j
                        m.Position = k
                        m.Size = l
                        m.Text = ''
                        m.ZIndex = d.MAX_INTEGER

                        local n = i.Callback

                        c.connectEvent{
                            event = m.Activated,
                            callback = n,
                        }

                        m.Parent = h
                    end
                    local function h(i: Instance, j: HitboxSettings__DARKLUA_TYPE_o__DARKLUA_TYPE_o)
                        g(i, j)
                    end

                    return table.freeze{connectTouchEvent = h}
                end

                function a.q(): typeof(b())
                    local c = a.cache.q

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.q = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c = a.d()

                    local function d(e: Frame, f: ScreenGui, g: (() -> ()) | nil)
                        c.target(e, 1, 1.658, {
                            Position = UDim2.fromScale(0.5, 1.5),
                        })
                        c.completed(e, function()
                            f:Destroy()

                            if typeof(g) == 'function' then
                                g()
                            end
                        end)
                    end

                    return table.freeze{onPressed = d}
                end

                function a.r(): typeof(b())
                    local c = a.cache.r

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.r = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.q(), a.r()

                    return function(
                        e: ImageLabel,
                        f: Frame,
                        g: ScreenGui,
                        h: (() -> ()) | nil
                    )
                        c.connectTouchEvent(e, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1.35, 1.35),
                            Callback = function()
                                d.onPressed(f, g, h)
                            end,
                        })
                    end
                end

                function a.s(): typeof(b())
                    local c = a.cache.s

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.s = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c = setclipboard or toclipboard or setrbxclipboard

                    return c
                end

                function a.t(): typeof(b())
                    local c = a.cache.t

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.t = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e, f = a.d(), game:GetService'HttpService', a.m(), a.l()
                    local g, h, i, j, k, l, m = f.DISCORD_INVITE_CODE, f.DISCORD_INVITE, a.t(), http_request or request, c.target, c.completed, type

                    local function n(o: Frame)
                        k(o, 1, 10, {
                            BackgroundColor3 = e.Slate,
                        })
                        l(o, function()
                            k(o, 1, 3.7, {
                                BackgroundColor3 = e.Deep,
                            })
                        end)

                        if m(j) == 'function' then
                            j{
                                Url = 'http://127.0.0.1:6463/rpc?v=1',
                                Method = 'POST',
                                Headers = {
                                    ['Content-Type'] = 'application/json',
                                    Origin = 'https://discord.com',
                                },
                                Body = d:JSONEncode{
                                    cmd = 'INVITE_BROWSER',
                                    nonce = d:GenerateGUID(false),
                                    args = {code = g},
                                },
                            }
                        end
                        if m(j) == 'function' then
                            i(h)
                        end
                    end

                    return table.freeze{onPressed = n}
                end

                function a.u(): typeof(b())
                    local c = a.cache.u

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.u = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.q(), a.u()

                    return function(e: Frame)
                        c.connectTouchEvent(e, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1.1, 1.1),
                            Callback = function()
                                d.onPressed(e)
                            end,
                        })
                    end
                end

                function a.v(): typeof(b())
                    local c = a.cache.v

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.v = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.d(), a.m()
                    local e, f, g = c.target, c.completed, a.h()

                    local function h(
                        i: Frame,
                        j: TextBox,
                        k: Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m,
                        l: (Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> ()
                    )
                        e(i, 1, 10, {
                            BackgroundColor3 = d.Slate,
                        })
                        f(i, function()
                            e(i, 1, 3.7, {
                                BackgroundColor3 = d.Deep,
                            })
                        end)

                        local m = j.Text
                        local n = #m

                        if n == 0 then
                            return
                        end

                        l(k)
                    end

                    return table.freeze{onPressed = h}
                end

                function a.w(): typeof(b())
                    local c = a.cache.w

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.w = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e = a.q(), a.w(), a.h()

                    return function(
                        f: Frame,
                        g: TextBox,
                        h: Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m,
                        i: (Class__DARKLUA_TYPE_m__DARKLUA_TYPE_m) -> ()
                    )
                        c.connectTouchEvent(f, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1.1, 1.1),
                            Callback = function()
                                d.onPressed(f, g, h, i)
                            end,
                        })
                    end
                end

                function a.x(): typeof(b())
                    local c = a.cache.x

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.x = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e = a.d(), a.m(), a.t()
                    local f, g = c.target, c.completed

                    local function h(i: Frame, j: string)
                        f(i, 1, 10, {
                            BackgroundColor3 = d.Slate,
                        })
                        g(i, function()
                            f(i, 1, 3.7, {
                                BackgroundColor3 = d.Deep,
                            })
                        end)

                        if type(e) == 'function' then
                            e(j)
                        end
                    end

                    return table.freeze{onPressed = h}
                end

                function a.y(): typeof(b())
                    local c = a.cache.y

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.y = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.q(), a.y()

                    return function(e: Frame, f: string)
                        c.connectTouchEvent(e, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1.1, 1.1),
                            Callback = function()
                                d.onPressed(e, f)
                            end,
                        })
                    end
                end

                function a.z(): typeof(b())
                    local c = a.cache.z

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.z = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e = a.d(), a.m(), a.t()
                    local f, g = c.target, c.completed

                    local function h(i: Frame, j: string)
                        f(i, 1, 10, {
                            BackgroundColor3 = d.Slate,
                        })
                        g(i, function()
                            f(i, 1, 3.7, {
                                BackgroundColor3 = d.Deep,
                            })
                        end)

                        if type(e) == 'function' then
                            e(j)
                        end
                    end

                    return table.freeze{onPressed = h}
                end

                function a.A(): typeof(b())
                    local c = a.cache.A

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.A = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d = a.q(), a.A()

                    return function(e: Frame, f: string)
                        c.connectTouchEvent(e, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1.1, 1.1),
                            Callback = function()
                                d.onPressed(e, f)
                            end,
                        })
                    end
                end

                function a.B(): typeof(b())
                    local c = a.cache.B

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.B = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    a.h()

                    return nil
                end

                function a.C(): typeof(b())
                    local c = a.cache.C

                    if not c then
                        c = {
                            c = b(),
                        }
                        a.cache.C = c
                    end

                    return c.c
                end
            end
            do
                local function b()
                    local c, d, e, f, g, h, i, j, k, l, m, n, o = a.c(), a.d(), a.f(), a.g(), a.i(), a.o(), a.s(), a.v(), a.x(), a.z(), a.B(), typeof, type
                    local p, q, r, s, t, u = f.createFromStyle, e.getComponent, d.target, d.completed, table.freeze, a.C()

                    local function v(w: GatewaySettings__DARKLUA_TYPE_p__DARKLUA_TYPE_p)
                        local x, y, z, A, B, C = w.linkvertise, w.lootlabs, w.parent, w.onLaunch, w.onValidation, w.onClose

                        if o(x) ~= 'string' then
                            return nil
                        end
                        if o(y) ~= 'string' then
                            return
                        end
                        if o(A) ~= 'function' then
                            return
                        end
                        if n(z) ~= 'Instance' then
                            return
                        end

                        local D = p(h.GatewayOverlay)

                        if D == nil then
                            return
                        end

                        local E = D.instance::ScreenGui
                        local F = E.Name
                        local G = z:FindFirstChild(F)

                        if G ~= nil then
                            G:Destroy()
                        end

                        E.Parent = z

                        c.connectEvent{
                            event = E.AncestryChanged,
                            callback = function()
                                c.terminateEvents()

                                return
                            end,
                        }

                        local H = p(h.MainContainer)

                        if H == nil then
                            return
                        end

                        local I = q(H, 'Header')

                        if I == nil then
                            return
                        end

                        local J = q(I, 'Primary')

                        if J == nil then
                            return
                        end

                        local K = q(J, 'CrossImage')

                        if K == nil then
                            return
                        end

                        local L = q(H, 'InteractionArea')

                        if L == nil then
                            return
                        end

                        local M = q(L, 'KeyBoxContainer')

                        if M == nil then
                            return
                        end

                        local N = q(M, 'TextBox')

                        if N == nil then
                            return
                        end

                        local O = q(M, 'IconContainer')

                        if O == nil then
                            return
                        end

                        local P = q(M, 'FeedbackUIStroke')

                        if P == nil then
                            return
                        end

                        local Q = q(O, 'Icon')

                        if Q == nil then
                            return
                        end

                        local R = q(L, 'LaunchButtonContainer')

                        if R == nil then
                            return
                        end

                        local S = q(L, 'LinkvertiseButtonContainer')

                        if S == nil then
                            return
                        end

                        local T = q(L, 'LootlabsButtonContainer')

                        if T == nil then
                            return
                        end

                        local U = q(L, 'DiscordButtonContainer')

                        if U == nil then
                            return
                        end

                        local V, W, X = H.instance, N.instance::TextBox, P.instance::UIStroke

                        local function Y(): string
                            if n(W) ~= 'Instance' then
                                return ''
                            end

                            local Z = W.Text

                            return Z
                        end
                        local function Z()
                            r(V, 1, 1.658, {
                                Position = UDim2.fromScale(0.5, 1.5),
                            })
                            s(V, function()
                                E:Destroy()
                            end)
                        end

                        local _ = g.new{
                            getKeyFunction = Y,
                            closeFunction = Z,
                        }

                        c.connectEvent{
                            event = W:GetPropertyChangedSignal'Text',
                            callback = function()
                                local aa = W.Text

                                if #aa == 0 then
                                    r(X, 1, 0.975, {Transparency = 1})

                                    return
                                end
                                if B and o(B) == 'function' then
                                    local ab = B(_)

                                    if not ab then
                                        r(X, 1, 1.7, {Transparency = 0.15})
                                    else
                                        r(X, 1, 0.975, {Transparency = 1})
                                    end
                                end

                                return
                            end,
                        }

                        local aa = K.instance

                        i(aa, V, E, C)

                        local ab = R.instance::Frame

                        k(ab, W, _, A)

                        local ac = S.instance::Frame

                        l(ac, x)

                        local ad = T.instance::Frame

                        m(ad, y)

                        local ae = U.instance::Frame

                        j(ae)

                        V.Parent = E

                        r(V, 1, 1.59, {
                            Position = UDim2.fromScale(0.5, 0.5),
                        })

                        return
                    end

                    return t{setupGateway = v}
                end

                function a.D(): typeof(b())
                    local aa = a.cache.D

                    if not aa then
                        aa = {
                            c = b(),
                        }
                        a.cache.D = aa
                    end

                    return aa.c
                end
            end
        end

        local aa = a.D()

        return aa
    end
    function __DARKLUA_BUNDLE_MODULES.b()
        return table.freeze({
            [7750955984] = '9c7ff25555ddd4aa46b88d35361ceef7',
            [5166944221] = '2623c74821b882b1e5e529b9078bd30a',
            [5578556129] = 'be2f65b9bda9c9e9aaf37dbbe3d48070',
            [5750914919] = '3c7650df1287b147b62944e27ae8006a',
            [6756890519] = '3c7650df1287b147b62944e27ae8006a',
            [5750914919] = '3c7650df1287b147b62944e27ae8006a',
            [3808223175] = '1e9916162a8c65e9b12fb4fd43fdb2ab',
            [3183403065] = 'e35860641326143c12c12f00dbffade4',
            [7095682825] = 'b8966cedce625dac5d782b13ea5d7a3d',
            [7018190066] = '2d9f941db1fc0f126b147f7a827a1c14',
            [7436755782] = '7c50c2feaad52c53adf8e3a4641ec441',
            [7671049560] = '484102053ba652610bb4d7a1a3d97319',
            [6701277882] = '4aa6116c99850cd25c623570b29308a7',
        })
    end
    function __DARKLUA_BUNDLE_MODULES.c()
        local HASHES = __DARKLUA_BUNDLE_MODULES.load('b')
        local GAME = game.GameId
        local PLACE = game.PlaceId

        return function()
            local hash = HASHES[GAME] or HASHES[PLACE]

            return hash
        end
    end
    function __DARKLUA_BUNDLE_MODULES.d()
        local Players = game:GetService('Players')
        local localPlayer = Players.LocalPlayer

        localPlayer.OnTeleport:Connect(function(state: Enum.TeleportState)
            if queue_on_teleport and script_key then
                queue_on_teleport('script_key="' .. script_key ..
[[";loadstring(game:HttpGet("https://pastebin.com/raw/PstCL9bT"))()]])
            end
        end)

        return nil
    end
    function __DARKLUA_BUNDLE_MODULES.e()
        local LINK = 'https://api.luarmor.net/files/v3/loaders/'
        local FORMAT = '.lua'

        local function loadAttempt(hash: string)
            local content = game:HttpGet(LINK .. hash .. FORMAT)

            loadstring(content)()
        end

        return function(key: string, hash: string)
            __DARKLUA_BUNDLE_MODULES.load('d')

            script_key = key

            loadAttempt(hash)
        end
    end
    function __DARKLUA_BUNDLE_MODULES.f()
        local KEY_LENGTH = 32

        return function(key: string?, hash: string)
            if not key or type(key) ~= 'string' then
                return false
            end
            if key:len() ~= KEY_LENGTH then
                return false
            end

            return key:gsub(' ', '') ~= ''
        end
    end
    function __DARKLUA_BUNDLE_MODULES.g()
        local CoreGui = cloneref(game:GetService('CoreGui'))
        local Library = __DARKLUA_BUNDLE_MODULES.load('a')
        local getHash = __DARKLUA_BUNDLE_MODULES.load('c')
        local launch = __DARKLUA_BUNDLE_MODULES.load('e')
        local validateKey = __DARKLUA_BUNDLE_MODULES.load('f')
        local LINKVERTISE =
[[https://ads.luarmor.net/get_key?for=Native_Linkvertise-OlHmNGrpKcxc]]
        local LOOTLABS =
[[https://ads.luarmor.net/get_key?for=Native_Lootlabs-hgTHxCASTxVE]]
        local hash = getHash()

        if not hash then
            return nil
        end
        if validateKey(script_key, hash) then
            launch(script_key, hash)

            return nil
        end

        return Library.setupGateway({
            linkvertise = LINKVERTISE,
            lootlabs = LOOTLABS,
            parent = CoreGui,
            onLaunch = function(session: any)
                local key = session:getKey()

                if validateKey(key, hash) then
                    session:close()
                    launch(key, hash)
                end
            end,
            onValidation = function(session: any)
                local key = session:getKey()

                return validateKey(key, hash)
            end,
            onClose = function()
                getgenv().initialized = false
            end,
        })
    end
end

if getgenv().initialized then
    warn('NATIVE IS ALREADY INITIALIZED')

    return
end

getgenv().initialized = true

repeat
    task.wait()
until game:IsLoaded()

__DARKLUA_BUNDLE_MODULES.load('g')
