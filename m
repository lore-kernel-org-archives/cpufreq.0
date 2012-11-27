From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 0/8] cpupower enhancements for 3.8
Date: Tue, 27 Nov 2012 13:17:41 +0100
Message-ID: <1354018669-63680-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

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
  cpupower: IvyBridge (0x3a and 0x3e models) support

 tools/power/cpupower/.gitignore                    |    7 +++
 tools/power/cpupower/Makefile                      |    3 +-
 tools/power/cpupower/debug/i386/Makefile           |    5 ++-
 tools/power/cpupower/man/cpupower-monitor.1        |   15 +++++-
 tools/power/cpupower/utils/helpers/cpuid.c         |    2 +
 tools/power/cpupower/utils/helpers/helpers.h       |   18 ++++---
 tools/power/cpupower/utils/helpers/sysfs.c         |   19 -------
 tools/power/cpupower/utils/helpers/topology.c      |   53 +++++++++++---------
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |   21 +++++++-
 .../cpupower/utils/idle_monitor/cpupower-monitor.h |   17 ++++++
 tools/power/cpupower/utils/idle_monitor/snb_idle.c |   10 +++-
 11 files changed, 110 insertions(+), 60 deletions(-)

-- 
1.7.6.1

