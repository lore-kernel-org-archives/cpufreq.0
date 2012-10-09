From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 0/8] cpupower enhancements for 3.7
Date: Tue,  9 Oct 2012 15:20:59 +0200
Message-ID: <1349788867-65962-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, linux@dominikbrodowski.net, rjw@sisk.pl

Hope it's not too late already...

Palmer Cox (6):
  cpupower tools: Remove brace expansion from clean target
  cpupower tools: Update .gitignore for files created in the debug
    directories
  cpupower tools: Fix minor warnings
  cpupower tools: Fix issues with sysfs_topology_read_file
  cpupower tools: Fix malloc of cpu_info structure
  cpupower tools: Fix warning and a bug with the cpu package count

Thomas Renninger (2):
  cpupower: Provide -c param for cpupower monitor to schedule process
    on all cores
  patch cpupower_ivy_bridge_support.patch

 tools/power/cpupower/.gitignore                    |    7 +++
 tools/power/cpupower/Makefile                      |    3 +-
 tools/power/cpupower/debug/i386/Makefile           |    5 ++-
 tools/power/cpupower/man/cpupower-monitor.1        |   15 +++++-
 tools/power/cpupower/utils/helpers/helpers.h       |   18 ++++---
 tools/power/cpupower/utils/helpers/sysfs.c         |   19 -------
 tools/power/cpupower/utils/helpers/topology.c      |   53 +++++++++++---------
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |   21 +++++++-
 .../cpupower/utils/idle_monitor/cpupower-monitor.h |   17 ++++++
 tools/power/cpupower/utils/idle_monitor/snb_idle.c |   10 +++-
 10 files changed, 108 insertions(+), 60 deletions(-)

-- 
1.7.6.1

