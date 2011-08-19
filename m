From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [RFC] cpupowerutils patches for 3.1-rc2
Date: Fri, 19 Aug 2011 17:20:19 +0200
Message-ID: <20110819152019.GA25905@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hey,

if no issues arise with these patches, I'll push the following patches --
which are available at
git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpupowerutils.git and
were discussed on this list -- upstream in the next days.

Best,
	Dominik


Amerigo Wang (1):
      cpupower: avoid using symlinks

Dave Jones (1):
      cpupower: fix Makefile typo

Dominik Brodowski (2):
      cpupower: make NLS truly optional
      cpupower: use man(1) when calling "cpupower help subcommand"

Thomas Renninger (4):
      cpupower: mperf monitor - Use TSC to calculate max frequency if possible
      cpupower: Do not show an empty Idle_Stats monitor if no idle driver is available
      cpupower: Better detect offlined CPUs
      cpupower: Make monitor command -c/--cpu aware

 tools/power/cpupower/Makefile                      |    7 +-
 tools/power/cpupower/debug/x86_64/Makefile         |    8 +-
 .../power/cpupower/debug/x86_64/centrino-decode.c  |    1 -
 .../cpupower/debug/x86_64/powernow-k8-decode.c     |    1 -
 tools/power/cpupower/man/cpupower-frequency-info.1 |    6 +-
 tools/power/cpupower/man/cpupower-frequency-set.1  |    8 +-
 tools/power/cpupower/man/cpupower.1                |   14 +-
 tools/power/cpupower/utils/builtin.h               |    7 -
 tools/power/cpupower/utils/cpufreq-info.c          |   42 +-----
 tools/power/cpupower/utils/cpufreq-set.c           |   29 +---
 tools/power/cpupower/utils/cpuidle-info.c          |   24 +---
 tools/power/cpupower/utils/cpupower-info.c         |   20 +--
 tools/power/cpupower/utils/cpupower-set.c          |   25 +---
 tools/power/cpupower/utils/cpupower.c              |   91 ++++++-----
 tools/power/cpupower/utils/helpers/helpers.h       |   12 ++
 tools/power/cpupower/utils/helpers/sysfs.c         |   50 ++++++
 tools/power/cpupower/utils/helpers/sysfs.h         |    2 +
 tools/power/cpupower/utils/helpers/topology.c      |    5 +-
 .../cpupower/utils/idle_monitor/cpuidle_sysfs.c    |    2 +-
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |   66 ++++----
 .../cpupower/utils/idle_monitor/mperf_monitor.c    |  177 ++++++++++++++-----
 21 files changed, 308 insertions(+), 289 deletions(-)
 delete mode 120000 tools/power/cpupower/debug/x86_64/centrino-decode.c
 delete mode 120000 tools/power/cpupower/debug/x86_64/powernow-k8-decode.c
