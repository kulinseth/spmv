--
-- BeBOP-Lua initialization.
--

--
-- The caller of this module MUST define the following
-- global symbols:
--
--   InputMat    The input matrix.
--

-- Needed to prevent _G.__index override below from
-- inadvertant infinite recursion.
--
if not rawget(_G, "OSKI_LUA_PATH") then
	OSKI_LUA_PATH = os.getenv("OSKI_LUA_PATH") or "/home/vuduc2/projects/bebop/oski/src-1.0/_install-icc-Tld_only/lib/oski/?.lua;/home/vuduc2/projects/bebop/oski/src-1.0/_install-icc-Tld_only/lib/oski/?"
end

--
-- Override global symbol table lookup method to provide on-demand
-- lookup and registration of matrix types.
--
setmetatable( _G, {
	__index = function ( _, name )
		local x = rawget( _G, name );
		if not x then
			if tryrequire(name) then -- try to load matrix type
				x = rawget( _G, name ) -- try to find name now...
			end
		end
		return x
	end
})

-- eof
