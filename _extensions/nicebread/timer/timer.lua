quarto.doc.add_html_dependency({
  name = "quarto-timer",
  version = "1.0.0",
  scripts = {"timer.js"},
  stylesheets = {"timer.css"},
  resources = {"bing.wav"}
})

return {
    -- Füge den Filter zu Pandoc hinzu
    {
        Div = function (div)
            if div.classes[1] == "timer" then
                local containerId = div.identifier
                local timeLimit = tonumber(div.attributes["seconds"]) or 300  -- Default: 300 Sekunden
                local startOn = div.attributes["starton"] or "slide" -- Default: timers run when visible
                local size = div.attributes["size"] or "100%" -- Default: 100%
                local sound = div.attributes["sound"] or "false" -- Default: kein Sound
            
                local b64_script = ""
                if not _G.quartoTimerSoundInjected and sound == "true" then
                    local dir = pandoc.path.directory(PANDOC_SCRIPT_FILE)
                    local file_path = pandoc.path.join({dir, "bing.wav"})
                    local f = io.open(file_path, "rb")
                    if f then
                        local sound_base64 = "data:audio/wav;base64," .. quarto.base64.encode(f:read("*all"))
                        f:close()
                        b64_script = '\n<script>window.quartoTimerSound = "' .. sound_base64 .. '";</script>\n'
                    end
                    _G.quartoTimerSoundInjected = true
                end

                local htmlSnippet = b64_script .. string.format([[
                    <div id="%s"></div>
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            initializeTimer("%s", %d, "%s", "%s", "%s");
                        });
                    </script>
                ]], containerId, containerId, timeLimit, startOn, size, sound)

                return pandoc.RawBlock("html", htmlSnippet)
            end
            return div
        end
    }
}
