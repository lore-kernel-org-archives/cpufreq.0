From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 0/4] Add some AMD boost state info and tiny fixes
Date: Tue,  1 Feb 2011 16:11:40 +0100
Message-ID: <cover.1296572755.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, herrmann.der.user@googlemail.com, Thomas Renninger <trenn@suse.de>

I picked up Andreas' patches and finalized them.
Based on the cpupowerutils branch.
Would be great if these can get applied.

Thanks,

     Thomas

Andreas Herrmann (2):
  libcpupower/cpufreq-info: Add basic functions to detect AMD CPB
    information
  libcpupower: libcpufreq: Provide boost information also for AMD
    family 12h and 15h

Thomas Renninger (2):
  Make linking quiet again
  cpufreq-aperf: mperf might tick faster than expected, esp on Intel

 Makefile              |   10 +++---
 lib/cpufreq.c         |    8 ++--
 lib/cpufreq.h         |    2 +-
 lib/msr.c             |   11 ------
 lib/msr.h             |    2 -
 lib/pci.c             |   89 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/pci.h             |    1 +
 utils/cpufreq-aperf.c |    5 ++-
 utils/cpufreq-info.c  |    5 ++-
 9 files changed, 107 insertions(+), 26 deletions(-)
 create mode 100644 lib/pci.c
 create mode 100644 lib/pci.h

-- 
1.7.3.4

