From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/3] cpupowerutils: cpufreq-bench must link against libcpupower
Date: Tue, 28 Sep 2010 13:13:28 +0200
Message-ID: <1285672408-26839-4-git-send-email-trenn@suse.de>
References: <201009281306.28835.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201009281306.28835.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 bench/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/bench/Makefile b/bench/Makefile
index 3d8fa21..9f3b195 100644
--- a/bench/Makefile
+++ b/bench/Makefile
@@ -1,4 +1,4 @@
-LIBS = -L../ -lm -lcpufreq
+LIBS = -L../ -lm -lcpupower
 
 OBJS = main.o parse.o system.o benchmark.o
 CFLAGS += -D_GNU_SOURCE -I../lib -DDEFAULT_CONFIG_FILE=\"$(confdir)/cpufreq-bench.conf\"
-- 
1.6.4.2

