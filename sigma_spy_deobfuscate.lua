--[[
    ⣿⣿⣿⣿⣿ SIGMA SPY ⣿⣿⣿⣿⣿
    ⣿⣯⡉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉
   ⠉⠻⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠈⠻⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠙⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⠀⠀⣉⣿⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⠀⠀⠀⣠⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
   ⠀⠀⢀⣴⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⣀⣴⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   ⣿⣿⣟⣁⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀
   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

    @author depso (depthso)
    @repo https://github.com/depthso
    @license MIT
    @description Sigma Remote Spy for Roblox
]]

-- deobfuscate by good just need fix ui to make it work

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- CORE CONFIGURATION
local Config = {
    UseWorkspace = false,
    NoActors = false,
    FolderName = 'Sigma Spy',
    RepoUrl = "https://raw.githubusercontent.com/0xfinder/Sigma-Spy/refs/heads/main",
    ParserUrl = "https://raw.githubusercontent.com/depthso/Roblox-parser/refs/heads/main/dist/Main.luau"
}

-- SIGMA SPY MAIN ENGINE
local SigmaSpy = {
    Enabled = true,
    LogRemotes = true,
    BlockRemotes = false,
    DecompileScripts = true,
    ActorTracking = true,
    connections = {},
    remoteLog = {},
    remoteHistory = {},
    remoteStats = {},
    gui = nil,
    logCount = 0
}

-- SERVICES HELPER
local Services = setmetatable({}, {
    __index = function(self, serviceName)
        local service = game:GetService(serviceName)
        return cloneref(service)
    end
})

-- ADVANCED REMOTE DATA TYPE
type RemoteData = {
    Remote: Instance,
    NoBacktrace: boolean?,
    IsReceive: boolean?,
    Args: {any},
    Id: string,
    Method: string,
    TransferType: string,
    ValueReplacements: { [string]: any },
    ReturnValues: {any},
    OriginalFunc: (Instance, ...any) -> ...any
}

-- REMOTE CLASS DATA (FULL SPEC)
local RemoteClassData = {
    ["RemoteEvent"] = {
        Send = {
            "FireServer",
            "fireServer"
        },
        Receive = {
            "OnClientEvent"
        }
    },
    ["RemoteFunction"] = {
        IsRemoteFunction = true,
        Send = {
            "InvokeServer",
            "invokeServer"
        },
        Receive = {
            "OnClientInvoke"
        }
    },
    ["UnreliableRemoteEvent"] = {
        Send = {
            "FireServer",
            "fireServer"
        },
        Receive = {
            "OnClientEvent"
        }
    },
    ["BindableEvent"] = {
        NoReceiveHook = true,
        Send = {
            "Fire"
        },
        Receive = {
            "Event"
        }
    },
    ["BindableFunction"] = {
        IsRemoteFunction = true,
        NoReceiveHook = true,
        Send = {
            "Invoke"
        },
        Receive = {
            "OnInvoke"
        }
    }
}

-- CONFIG OVERRIDES (Executor specific)
local ConfigOverrides = {
    [{"synapse", "potassium", "wave"}] = {
        ForceUseCustomComm = true
    }
}

-- MAIN PROCESS MODULE (FULLY DEOBFUSCATED)
local Process = {
    RemoteClassData = RemoteClassData,
    RemoteOptions = {},
    LoopingRemotes = {},
    ConfigOverrides = ConfigOverrides
}

-- UTILITY FUNCTIONS
function Process:Merge(Base: table, New: table)
    if not New then return end
    for Key, Value in next, New do
        Base[Key] = Value
    end
end

function Process:Init(Data)
    local Modules = Data.Modules
    local Services = Data.Services
    
    -- Services
    HttpService = Services.HttpService
    
    -- Modules
    Config = Modules.Config
    Ui = Modules.Ui
    Hook = Modules.Hook
    Communication = Modules.Communication
    ReturnSpoofs = Modules.ReturnSpoofs
end

-- CHANNEL MANAGEMENT
local Channel
local WrappedChannel = false
local SigmaENV = getfenv(1)

function Process:SetChannel(NewChannel: BindableEvent, IsWrapped: boolean)
    Channel = NewChannel
    WrappedChannel = IsWrapped
end

-- CONFIGURATION SYSTEM
function Process:GetConfigOverrides(Name: string)
    local ConfigOverrides = self.ConfigOverrides
    
    for List, Overrides in next, ConfigOverrides do
        if not table.find(List, Name) then continue end
        return Overrides
    end
    return
end

function Process:CheckConfig(Config: table)
    local Name = identifyexecutor():lower()
    
    -- Force configuration overrides for specific executors
    local Overrides = self:GetConfigOverrides(Name)
    if not Overrides then return end
    
    self:Merge(Config, Overrides)
end

-- ERROR CLEANING
function Process:CleanCErorr(Error: string): string
    Error = Error:gsub(":%d+:%s", " ")
    Error = Error:gsub(", got %a+", "")
    Error = Error:gsub("invalid argument", "missing argument")
    return Error
end

-- STRING MATCHING
function Process:CountMatches(String: string, Match: string): number
    local Count = 0
    for _ in String:gmatch(Match) do
        Count += 1 
    end
    return Count
end

-- DEEP VALUE CHECKING/CLONING
function Process:CheckValue(Value, Ignore: table?, Cache: table?)
    local Type = typeof(Value)
    Communication:WaitCheck()
    
    if Type == "table" then
        Value = self:DeepCloneTable(Value, Ignore, Cache)
    elseif Type == "Instance" then
        Value = cloneref(Value)
    end
    
    return Value
end

function Process:DeepCloneTable(Table, Ignore: table?, Visited: table?): table
    if typeof(Table) ~= "table" then return Table end
    local Cache = Visited or {}
    
    -- Check for cached
    if Cache[Table] then
        return Cache[Table]
    end
    
    local New = {}
    Cache[Table] = New
    
    for Key, Value in next, Table do
        -- Check if the value is ignored
        if Ignore and table.find(Ignore, Value) then continue end
        
        Key = self:CheckValue(Key, Ignore, Cache)
        New[Key] = self:CheckValue(Value, Ignore, Cache)
    end
    
    -- Master clear
    if not Visited then
        table.clear(Cache)
    end
    
    return New
end

function Process:Unpack(Table: table)
    if not Table then return Table end
    local Length = table.maxn(Table)
    return unpack(Table, 1, Length)
end

-- EXECUTOR CHECKS
function Process:FuncExists(Name: string)
    return SigmaENV[Name]
end

function Process:CheckExecutor(): boolean
    local Blacklisted = {
        "xeno",
        "solaria",
        "jjexploit"
    }
    
    local Name = identifyexecutor():lower()
    local IsBlacklisted = table.find(Blacklisted, Name)
    
    -- Some executors have broken functionality
    if IsBlacklisted then
        Ui:ShowUnsupportedExecutor(Name)
        return false
    end
    
    return true
end

function Process:CheckFunctions(): boolean
    local CoreFunctions = {
        "hookmetamethod",
        "hookfunction",
        "getrawmetatable",
        "setreadonly"
    }
    
    -- Check if the functions exist in the ENV
    for _, Name in CoreFunctions do
        local Func = self:FuncExists(Name)
        if Func then continue end
        
        -- Function missing!
        Ui:ShowUnsupported(Name)
        return false
    end
    
    return true
end

function Process:CheckIsSupported(): boolean
    -- Check if the executor is blacklisted
    local ExecutorSupported = self:CheckExecutor()
    if not ExecutorSupported then
        return false
    end
    
    -- Check if the core functions exist
    local FunctionsSupported = self:CheckFunctions()
    if not FunctionsSupported then
        return false
    end
    
    return true
end

-- REMOTE CLASS LOOKUP
function Process:GetClassData(Remote: Instance): table?
    local RemoteClassData = self.RemoteClassData
    local ClassName = Hook:Index(Remote, "ClassName")
    
    return RemoteClassData[ClassName]
end

-- PROTECTED REMOTE CHECK
function Process:IsProtectedRemote(Remote: Instance): boolean
    local IsDebug = Remote == Communication.DebugIdRemote
    local IsChannel = Remote == (WrappedChannel and Channel.Channel or Channel)
    
    return IsDebug or IsChannel
end

-- REMOTE ALLOWANCE CHECK
function Process:RemoteAllowed(Remote: Instance, TransferType: string, Method: string?): boolean?
    if typeof(Remote) ~= 'Instance' then return end
    
    -- Check if the REMOTE is protected
    if self:IsProtectedRemote(Remote) then return end
    
    -- Fetch class table
    local ClassData = self:GetClassData(Remote)
    if not ClassData then return end
    
    -- Check if the transfer type has data
    local Allowed = ClassData[TransferType]
    if not Allowed then return end
    
    -- Check if the method is allowed
    if Method then
        return table.find(Allowed, Method) ~= nil
    end
    
    return true
end

-- EXTRA DATA MANAGEMENT
function Process:SetExtraData(Data: table)
    if not Data then return end
    self.ExtraData = Data
end

-- RETURN SPOOFING
function Process:GetRemoteSpoof(Remote: Instance, Method: string, ...): table?
    local Spoof = ReturnSpoofs[Remote]
    
    if not Spoof then return end
    if Spoof.Method ~= Method then return end
    
    local ReturnValues = Spoof.Return
    
    -- Call the ReturnValues function type
    if typeof(ReturnValues) == "function" then
        ReturnValues = ReturnValues(...)
    end
    
    return ReturnValues
end

function Process:SetNewReturnSpoofs(NewReturnSpoofs: table)
    ReturnSpoofs = NewReturnSpoofs
end

-- CALLING CLOSURE FINDER
function Process:FindCallingClosure(Offset: number)
    local Getfenv = Hook:GetOriginalFunc(getfenv)
    Offset += 1
    
    while true do
        Offset += 1
        
        -- Check if the stack level is valid
        local IsValid = debug.info(Offset, "l") ~= -1
        if not IsValid then continue end
        
        -- Check if the function is valid
        local Func = debug.info(Offset, "f")
        if not Func then return end
        if Getfenv(Func) == SigmaENV then continue end
        
        return Func
    end
end

-- SCRIPT DECOMPILER
function Process:Decompile(Script: LocalScript | ModuleScript): string
    local KonstAPI = "http://api.plusgiant5.com/konstant/decompile"
    local ForceKonstant = Config.ForceKonstantDecompile
    
    -- Use built-in decompiler if the executor supports it
    if decompile and not ForceKonstant then 
        return decompile(Script)
    end
    
    -- getscriptbytecode
    local Success, Bytecode = pcall(getscriptbytecode, Script)
    if not Success then
        local Error = `--Failed to get script bytecode, error:`
        Error ..= `--[${Bytecode}]`
        return Error, true
    end
    
    -- Send POST request to the API
    local Response = request({
        Url = KonstAPI,
        Body = Bytecode,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "text/plain"
        },
    })
    
    -- Error check
    if Response.StatusCode >= 200 then
        local Error = `--[KONSTANT] Error occurred while requesting the API, error:`
        Error ..= `--[${Response.Body}]`
        return Error, true
    end
    
    return Response.Body
end

-- SCRIPT EXTRACTION
function Process:GetScriptFromFunc(Func: (...any) -> ...any)
    if not Func then return end
    
    local Success, ENV = pcall(getfenv, Func)
    if not Success then return end
    
    -- Blacklist sigma spy
    if self:IsSigmaSpyENV(ENV) then return end
    
    return rawget(ENV, "script")
end

-- CONNECTION VALIDATION
function Process:ConnectionIsValid(Connection: table): boolean
    local ValueReplacements = {
        ["Script"] = function(Connection: table): Script?
            local Func = Connection.Function
            if not Func then return end
            
            return self:GetScriptFromFunc(Func)
        end
    }
    
    -- Check if these properties are valid
    local ToCheck = {
        "Script"
    }
    for _, Property in ToCheck do
        local Replacement = ValueReplacements[Property]
        local Value
        
        -- Check if there's a function for a property
        if Replacement then
            Value = Replacement(Connection)
        end
        
        -- Check if the property has a value
        if Value == nil then 
            return false 
        end
    end
    
    return true
end

-- CONNECTION FILTERING
function Process:FilterConnections(Signal: RBXScriptSignal): table
    local Processed = {}
    
    -- Filter each connection
    for _, Connection in getconnections(Signal) do
        if not self:ConnectionIsValid(Connection) then continue end
        table.insert(Processed, Connection)
    end
    
    return Processed
end

-- SIGMA SPY ENV CHECK
function Process:IsSigmaSpyENV(Env: table): boolean
    return Env == SigmaENV
end

-- REMOTE DATA MANAGEMENT
function Process:GetRemoteData(Id: string)
    local RemoteOptions = self.RemoteOptions
    
    -- Check for existing remote data
    local Existing = RemoteOptions[Id]
    if Existing then return Existing end
    
    -- Base remote data
    local Data = {
        Excluded = false,
        Blocked = false
    }
    
    RemoteOptions[Id] = Data
    return Data
end

-- DISCORD RPC (FULL IMPLEMENTATION)
function Process:CallDiscordRPC(Body: table)
    request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Origin"] = "https://discord.com/"
        },
        Body = HttpService:JSONEncode(Body)
    })
end

function Process:PromptDiscordInvite(InviteCode: string)
    self:CallDiscordRPC({
        cmd = "INVITE_BROWSER",
        nonce = HttpService:GenerateGUID(false),
        args = {
            code = InviteCode
        }
    })
end

-- CALLBACK HOOKING SYSTEM
local ProcessCallBack = newcclosure(function(Data: RemoteData, Remote, ...): table?
    -- Unpack Data
    local OriginalFunc = Data.OriginalFunc
    local Id = Data.Id
    local Method = Data.Method
    
    -- Check if the REMOTE is Blocked
    local RemoteData = Process:GetRemoteData(Id)
    if RemoteData.Blocked then return {} end
    
    -- Check for a spoof
    local Spoof = Process:GetRemoteSpoof(Remote, Method, OriginalFunc, ...)
    if Spoof then return Spoof end
    
    -- Check if the original function was passed
    if not OriginalFunc then return end
    
    -- Invoke original function
    return {
        OriginalFunc(Remote, ...)
    }
end)

-- MAIN REMOTE PROCESSOR (HEART OF SIGMA SPY)
function Process:ProcessRemote(Data: RemoteData, Remote, ...): table?
    -- Unpack Data
    local Method = Data.Method
    local TransferType = Data.TransferType
    local IsReceive = Data.IsReceive
    
    -- Check if the transferType method is allowed
    if TransferType and not self:RemoteAllowed(Remote, TransferType, Method) then return end
    
    -- Fetch details
    local Id = Communication:GetDebugId(Remote)
    local ClassData = self:GetClassData(Remote)
    local Timestamp = tick()
    
    local CallingFunction
    local SourceScript
    
    -- Add extra data into the log if needed
    local ExtraData = self.ExtraData
    if ExtraData then
        self:Merge(Data, ExtraData)
    end
    
    -- Get caller information
    if not IsReceive then
        CallingFunction = self:FindCallingClosure(6)
        SourceScript = CallingFunction and self:GetScriptFromFunc(CallingFunction) or nil
    end
    
    -- Add to queue
    self:Merge(Data, {
        Remote = cloneref(Remote),
        CallingScript = getcallingscript(),
        CallingFunction = CallingFunction,
        SourceScript = SourceScript,
        Id = Id,
        ClassData = ClassData,
        Timestamp = Timestamp,
        Args = {...}
    })
    
    -- Invoke the Remote and log return values
    local ReturnValues = ProcessCallBack(Data, Remote, ...)
    Data.ReturnValues = ReturnValues
    
    -- Queue log
    Communication:QueueLog(Data)
    
    return ReturnValues
end

-- BATCH REMOTE DATA
function Process:SetAllRemoteData(Key: string, Value)
    local RemoteOptions = self.RemoteOptions
    for RemoteId, Data in next, RemoteOptions do
        Data[Key] = Value
    end
end

-- REMOTE DATA SYNCHRONIZATION
function Process:SetRemoteData(Id: string, RemoteData: table)
    local RemoteOptions = self.RemoteOptions
    RemoteOptions[Id] = RemoteData
end

function Process:UpdateRemoteData(Id: string, RemoteData: table)
    Communication:Communicate("RemoteData", Id, RemoteData)
end

function Process:UpdateAllRemoteData(Key: string, Value)
    Communication:Communicate("AllRemoteData", Key, Value)
end

return Process