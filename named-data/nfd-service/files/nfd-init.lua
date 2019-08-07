require("io")
require("luci.util")
require("uci")
x = uci.cursor()

function confedit(v)
  print("CONFEDIT " .. v)
end

function confedit2(v, e)
  e, _ = e:gsub("\n", "\\n")
  print("echo -e '" .. e .. "' | CONFEDIT " .. v)
end

function initcmd(v)
  print("INITCMD " .. v)
end

function asYesNo(v)
  if v == "1" then
    return "yes"
  end
  return "no"
end

confedit("-s log.default_level -v INFO")

x:foreach("nfd", "cs", function(s)
  confedit("-s tables.cs_max_packets -v " .. (s["capacity"] or 1024))
  confedit("-s tables.cs_policy -v " .. (s["policy"] or "lru"))
end)

x:foreach("nfd", "strategy", function(s)
  local strategy = s["strategy"]
  if strategy:sub(1, 1) ~= "/" then
    strategy = "/localhost/nfd/strategy/" .. strategy
  end
  confedit("-s tables.strategy_choice." .. s["prefix"] .. " -v " .. strategy)
end)

x:foreach("nfd", "face_system", function(s)
  confedit("-s face_system.unix -v ''")

  confedit("-s face_system.ether.listen -v " .. asYesNo(s["ether_listen"]))
  confedit("-s face_system.ether.mcast -v " .. asYesNo(s["ether_mcast"]))
  local blacklist = s["ether_mcast_blacklist"] or {}
  for i = 1, #blacklist do
    confedit("-p face_system.ether.blacklist.ifname -v " .. blacklist[i])
  end

  confedit("-s face_system.udp.listen -v " .. asYesNo(s["udp_listen"]))
  confedit("-s face_system.udp.mcast -v " .. asYesNo(s["udp_mcast"]))
  local blacklist = s["udp_mcast_blacklist"] or {}
  for i = 1, #blacklist do
    confedit("-p face_system.udp.blacklist.ifname -v " .. blacklist[i])
  end

  confedit("-s face_system.tcp.listen -v " .. asYesNo(s["tcp_listen"]))

  if s["ws_listen"] == "1" then
    confedit("-s face_system.websocket.listen -v yes")
  end

  local brctlProcess = io.popen("brctl show | awk 'NF==4||NF==1 { print $NF }'")
  local blacklist = brctlProcess:read("*a"):split("\n")
  brctlProcess:close()
  local i = 1, #blacklist-1 do
    confedit("-p face_system.ether.blacklist.ifname -v " .. blacklist[i])
    confedit("-p face_system.udp.blacklist.ifname -v " .. blacklist[i])
  end
end)

confedit2("-a authorizations.authorize",
          "certfile mgmt.ndncert\n" ..
          "privileges\n" ..
          "{\n" ..
          "  faces\n" ..
          "  fib\n" ..
          "  cs\n" ..
          "  strategy-choice\n" ..
          "}\n")

x:foreach("nfd", "rib", function(s)
  if s["lockdown_localhost"] == "1" then
    confedit2("-a rib.localhost_security.rule",
              "id command\n" ..
              "for interest\n" ..
              "checker\n" ..
              "{\n" ..
              "  type customized\n" ..
              "  sig-type ecdsa-sha256\n" ..
              "  key-locator\n" ..
              "  {\n" ..
              "    type name\n" ..
              "    name /\n" ..
              "    relation is-prefix-of\n" ..
              "  }\n" ..
              "}\n")
    -- confedit2("-a rib.localhost_security.rule",
    --           "id cert\n" ..
    --           "for data\n" ..
    --           "checker\n" ..
    --           "{\n" ..
    --           "  type customized\n" ..
    --           "  sig-type ecdsa-sha256\n" ..
    --           "  key-locator\n" ..
    --           "  {\n" ..
    --           "    type name\n" ..
    --           "    name /localhost/root\n" ..
    --           "    relation is-prefix-of\n" ..
    --           "  }\n" ..
    --           "}\n")
    -- confedit2("-a rib.localhost_security.trust-anchor",
    --           "type file\n" ..
    --           "file-name localroot.ndncert\n")
    confedit2("-a rib.localhost_security.trust-anchor",
              "type file\n" ..
              "file-name mgmt.ndncert\n")
  else
    confedit("-s rib.localhost_security.trust-anchor.type -v any")
  end

  if s["propagate"] == "1" then
    confedit("-s rib.auto_prefix_propagate.refresh_interval " ..
             "-v " .. (s["propagate_refresh"] or "300"))
  end
end)

x:foreach("nfd", "face", function(s)
  if s["use_autoconfig"] == "1" then
    local fchArg = ""
    if s["fch_server"] then
      fchArg = "--ndn-fch-url " .. s["fch_server"]
    end
    initcmd("ndn-autoconfig " .. fchArg)
    return
  end

  local cmd = "/etc/init.d/nfd connect " .. s["remote"]
  local routes = s["route"] or {}
  for i = 1, #routes do
    cmd = cmd .. " " .. routes[i]
  end
  initcmd(cmd)
end)

