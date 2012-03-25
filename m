From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [git pull] cpupowerutils updates for 3.4
Date: Sun, 25 Mar 2012 20:38:07 +0200
Message-ID: <20120325183807.GA26398@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

Linus,

a few cpupower updates for 3.4 are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpupowerutils.git=
 master

Please pull from that location. The diffstat and list of changes is bel=
ow,
the individual diffs are sent (at least) to the cpufreq list.

Thanks,
        Dominik

=46ranck Bui-Huu (5):
      cpupower tool: remove use of undefined variables from the clean t=
arget of the top makefile
      cpupower tool: makefile: simplify the recipe used to generate cpu=
power.pot target
      cpupower tool: allow to build in a separate directory
      cpupower tools: allow to build debug tools in a separate director=
y too
      cpupower tools: add install target to the debug tools' makefiles

Ozan =C3=87a=C4=9Flayan (1):
      cpupower: Fix linking with --as-needed

Thomas Renninger (7):
      cpupower: Better interface for accessing AMD pci registers
      cpupower: AMD fam14h/Ontario monitor can also be used by fam12h c=
pus
      cpupower: Add cpupower-idle-info manpage
      cpupower: Unify cpupower-frequency-* manpages
      cpupower: Fix number of idle states
      cpupower: Remove unneeded code and by that fix a memleak
      cpupower: Fix broken mask values

 tools/power/cpupower/Makefile                      |   93 ++++++++++++=
--------
 tools/power/cpupower/bench/Makefile                |   23 +++--
 tools/power/cpupower/debug/i386/Makefile           |   40 ++++++---
 tools/power/cpupower/debug/x86_64/Makefile         |   26 +++++-
 tools/power/cpupower/man/cpupower-frequency-info.1 |    4 +-
 tools/power/cpupower/man/cpupower-frequency-set.1  |    4 +-
 tools/power/cpupower/man/cpupower-idle-info.1      |   90 ++++++++++++=
+++++++
 tools/power/cpupower/man/cpupower-monitor.1        |    2 +-
 tools/power/cpupower/utils/cpuidle-info.c          |   12 +--
 tools/power/cpupower/utils/helpers/amd.c           |    4 +-
 tools/power/cpupower/utils/helpers/helpers.h       |   11 ++-
 tools/power/cpupower/utils/helpers/pci.c           |   35 +++++---
 .../cpupower/utils/idle_monitor/amd_fam14h_idle.c  |   25 +++---
 13 files changed, 259 insertions(+), 110 deletions(-)
 create mode 100644 tools/power/cpupower/man/cpupower-idle-info.1
