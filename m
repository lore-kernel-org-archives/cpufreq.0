From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 0/2] cpupower: Rename from cpupowerutils to cpupower
Date: Thu, 21 Apr 2011 17:45:14 +0200
Message-ID: <1303400716-37749-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: Thomas Renninger <trenn@suse.de>

As the tool sits in tools/power/cpupower, the package should better
be named cpupower instead of cpupowerutils.
It's only some unintrusive changes...

For renameing libcpufreq->libcpupower:
If people rely on libcpufreq, it's easy to provide
it additionally.
For cpufrequtils getting renamed and hopefully added to
the kernel soon, there should be a clean cut and things
should be done properly: provide one library called libcpupower.

Patches based on Dominik's latest cpupowerutils tree:
git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpupowerutils.git

Please consider to apply.

Thomas Renninger (2):
  cpupowerutils: Finalize the renaming: libcpufreq->libcpupower
  patch remove_utils_from_name

 tools/power/cpupower/Makefile       |   38 +++++++++++++++++-----------------
 tools/power/cpupower/bench/Makefile |    2 +-
 2 files changed, 20 insertions(+), 20 deletions(-)

-- 
1.7.3.4

