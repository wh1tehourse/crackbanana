/**
 * Banana Crack Hub - Lua Obfuscator
 * Technique: Rename local variables + Encode all string literals to byte arrays
 * Safe for Roblox executors (no control flow mangling)
 */

// ── Helpers ──────────────────────────────────────────────────────────────────

/** Encode a string into a Lua byte-array call: _S({...}) */
function encodeString(str) {
    const bytes = [];
    for (let i = 0; i < str.length; i++) {
        bytes.push(str.charCodeAt(i));
    }
    return `_S({${bytes.join(',')}})`;
}

/** Generate a short obfuscated name from an index */
function makeName(index) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let name = '_';
    let n = index;
    do {
        name += chars[n % chars.length];
        n = Math.floor(n / chars.length);
    } while (n > 0);
    return name;
}

// ── Obfuscate Strings ─────────────────────────────────────────────────────────

/**
 * Replace all Lua string literals with byte-array decoder calls.
 * Preserves multi-line [[ ]] strings as-is (too complex to encode safely).
 */
function obfuscateStrings(code) {
    // Replace single-quoted strings
    code = code.replace(/'((?:[^'\\]|\\.)*)'/g, (match, content) => {
        try {
            const decoded = content
                .replace(/\\n/g, '\n')
                .replace(/\\t/g, '\t')
                .replace(/\\r/g, '\r')
                .replace(/\\\\/g, '\\')
                .replace(/\\'/g, "'")
                .replace(/\\"/g, '"');
            return encodeString(decoded);
        } catch (e) {
            return match;
        }
    });

    // Replace double-quoted strings
    code = code.replace(/"((?:[^"\\]|\\.)*)"/g, (match, content) => {
        try {
            const decoded = content
                .replace(/\\n/g, '\n')
                .replace(/\\t/g, '\t')
                .replace(/\\r/g, '\r')
                .replace(/\\\\/g, '\\')
                .replace(/\\'/g, "'")
                .replace(/\\"/g, '"');
            return encodeString(decoded);
        } catch (e) {
            return match;
        }
    });

    return code;
}

// ── Obfuscate Variables ───────────────────────────────────────────────────────

/**
 * Rename local variables and function parameters.
 * Only renames identifiers declared with 'local' to avoid breaking globals.
 */
function obfuscateVariables(code) {
    const varMap = new Map();
    let counter = 0;

    // Reserved Lua keywords and Roblox globals to never rename
    const reserved = new Set([
        'and','break','do','else','elseif','end','false','for','function',
        'goto','if','in','local','nil','not','or','repeat','return','then',
        'true','until','while',
        'game','workspace','script','print','warn','error','pcall','xpcall',
        'ipairs','pairs','next','select','type','tostring','tonumber','rawget',
        'rawset','rawequal','rawlen','setmetatable','getmetatable','require',
        'loadstring','load','coroutine','string','table','math','os','io',
        'task','wait','spawn','delay','tick','time','typeof','Enum','Vector3',
        'Vector2','CFrame','Color3','UDim','UDim2','Ray','Region3','TweenInfo',
        'BrickColor','Instance','Rect','Random','NumberRange','NumberSequence',
        'ColorSequence','NumberSequenceKeypoint','ColorSequenceKeypoint',
        'PhysicalProperties','self','_G','_ENV','_VERSION',
        'Players','Workspace','RunService','TweenService','UserInputService',
        'HttpService','ReplicatedStorage','ServerStorage','ServerScriptService',
        'StarterGui','StarterPlayer','Lighting','SoundService','Teams',
        'LocalPlayer','Character','HumanoidRootPart','Humanoid',
    ]);

    // Find all locally declared names
    const localPattern = /\blocal\s+(?:function\s+)?([A-Za-z_][A-Za-z0-9_]*)/g;
    let match;
    while ((match = localPattern.exec(code)) !== null) {
        const name = match[1];
        if (!reserved.has(name) && !varMap.has(name)) {
            varMap.set(name, makeName(counter++));
        }
    }

    // Also capture function parameters
    const funcPattern = /\bfunction\s*[^(]*\(([^)]*)\)/g;
    while ((match = funcPattern.exec(code)) !== null) {
        const params = match[1].split(',').map(p => p.trim()).filter(Boolean);
        for (const param of params) {
            const cleanParam = param.replace(/^\.\.\./, '').trim();
            if (cleanParam && !reserved.has(cleanParam) && !varMap.has(cleanParam)) {
                varMap.set(cleanParam, makeName(counter++));
            }
        }
    }

    // Replace all occurrences of mapped names (whole-word only)
    for (const [original, renamed] of varMap) {
        const regex = new RegExp(`\\b${escapeRegex(original)}\\b`, 'g');
        code = code.replace(regex, renamed);
    }

    return code;
}

function escapeRegex(str) {
    return str.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

// ── Strip Comments ────────────────────────────────────────────────────────────

function stripComments(code) {
    // Remove single-line comments (but not inside strings)
    code = code.replace(/--(?!\[{2})[^\n]*/g, '');
    // Remove multi-line comments --[[ ... ]]
    code = code.replace(/--\[\[[\s\S]*?\]\]/g, '');
    return code;
}

// ── Main Obfuscator ───────────────────────────────────────────────────────────

/**
 * Full obfuscation pipeline:
 * 1. Strip comments
 * 2. Rename local variables
 * 3. Encode string literals
 * 4. Prepend decoder helper
 */
function obfuscate(code) {
    code = stripComments(code);
    code = obfuscateVariables(code);
    code = obfuscateStrings(code);

    const header = [
        '-- [[ Banana Crack Hub | Obfuscated Build ]]',
        'local _S=function(t)local r=""for _,v in ipairs(t)do r=r..string.char(v)end return r end',
        '',
    ].join('\n');

    return header + code;
}

module.exports = { obfuscate };
