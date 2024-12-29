# ==================== SSH-only: OH MY ZSH & SysInfo =====================
if [[ -n "$SSH_CLIENT" ]]; then

    # ---------- (1) 显示彩虹 ASCII 艺术 ----------
    cat << "EOF" | lolcat --spread=2 --freq=0.2 --seed=123

        __                                     __
  ____  / /_     ____ ___  __  __   ____  _____/ /_
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                        /____/
   ----------------------------------------------
                This is Oak's Server
   ----------------------------------------------
EOF

    # ---------- (2) 系统信息 (四列，无IP/存储) ----------

    # 1) 系统负载
    loadavg=$(awk '{print $1,$2,$3}' /proc/loadavg)

    # 2) 内存(单位 MB)，避免 division by zero
    memTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    memUsed=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    memUsed=$((memTotal - memUsed))

    # 将 KB 转换为 MB
    memTotal=$((memTotal / 1024))
    memUsed=$((memUsed / 1024))

    # 如果取不到或为 0，则 memPct 设为 N/A
    if [ -z "$memTotal" ] || [ "$memTotal" -eq 0 ] 2>/dev/null; then
        memPct="N/A"
    else
        memPct=$((memUsed * 100 / memTotal))
    fi

    # 3) 运行时间(天)
    upDays=$(awk '{print int($1/86400)}' /proc/uptime)

    # 4) CPU 型号 & 核心数
    cpuModel=$(awk -F': +' '/^model name/{print $2; exit}' /proc/cpuinfo)
    [ -z "$cpuModel" ] && cpuModel=$(awk -F': +' '/^Hardware/{print $2; exit}' /proc/cpuinfo)
    cpuCores=$(awk -F': +' '/^processor/{count++} END{print count}' /proc/cpuinfo)
    [ -z "$cpuCores" ] && cpuCores=1

    # 定义颜色
    GREEN="\033[32m"
    RESET="\033[0m"

    # 打印信息，两行、左右两列
    echo
    echo -e "SysLoad： ${GREEN}${loadavg}${RESET}\t\tRuntime： ${GREEN}${upDays} days${RESET}"
    echo -e "MemUsed： ${GREEN}${memPct}%${RESET} of ${memTotal}MB\t\tCPUinfo： ${GREEN}${cpuModel} x ${cpuCores}${RESET}"
    echo

fi
# ==================== End SSH-only: OH MY ZSH & SysInfo =================

# ==================== ALL Terminal Theme =====================
# ---------- (1) 显示彩虹 ASCII 艺术 ----------
cat << "EOF" | lolcat --spread=2 --freq=0.2 --seed=123

    __                                     __
  ____  / /_     ____ ___  __  __   ____  _____/ /_
 / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                        /____/
   ----------------------------------------------
            Welcome to Terminal Theme
   ----------------------------------------------
EOF

# ---------- (2) 系统信息 (四列，无IP/存储) ----------
# 1) 系统负载
loadavg=$(awk '{print $1,$2,$3}' /proc/loadavg)

# 2) 内存(单位 MB)
memTotal=$(grep MemTotal /proc/meminfo | awk '{print $2}')
memUsed=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
memUsed=$((memTotal - memUsed))

# 将 KB 转换为 MB
memTotal=$((memTotal / 1024))
memUsed=$((memUsed / 1024))

# 计算内存使用百分比
if [ -z "$memTotal" ] || [ "$memTotal" -eq 0 ] 2>/dev/null; then
    memPct="N/A"
else
    memPct=$((memUsed * 100 / memTotal))
fi

# 3) 运行时间(天)
upDays=$(awk '{print int($1/86400)}' /proc/uptime)

# 4) CPU 型号 & 核心数
cpuModel=$(awk -F': +' '/^model name/{print $2; exit}' /proc/cpuinfo)
[ -z "$cpuModel" ] && cpuModel=$(awk -F': +' '/^Hardware/{print $2; exit}' /proc/cpuinfo)
cpuCores=$(awk -F': +' '/^processor/{count++} END{print count}' /proc/cpuinfo)
[ -z "$cpuCores" ] && cpuCores=1

# 定义颜色
GREEN="\033[32m"
RESET="\033[0m"

# 打印信息，两行、左右两列
echo
echo -e "SysLoad： ${GREEN}${loadavg}${RESET}\t\tRuntime： ${GREEN}${upDays} days${RESET}"
echo -e "MemUsed： ${GREEN}${memPct}%${RESET} of ${memTotal}MB\t\tCPUinfo： ${GREEN}${cpuModel} x ${cpuCores}${RESET}"
echo
# ==================== End ALL Terminal Theme =================