From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/3] cpupowerutuils: Jump to version 010
Date: Tue, 28 Sep 2010 13:13:26 +0200
Message-ID: <1285672408-26839-2-git-send-email-trenn@suse.de>
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

Jump from version 008 to 010.
Theoretically there could still be an cpufrequtils update to 009, but even
if not, having a gap to show there were quite some changes is a good idea.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 5bcd0e0..a53b440 100644
--- a/Makefile
+++ b/Makefile
@@ -47,7 +47,7 @@ DESTDIR ?=
 # Package-related definitions. Distributions can modify the version
 # and _should_ modify the PACKAGE_BUGREPORT definition
 
-VERSION =			008
+VERSION =			010
 LIB_MAJ=			0.0.0
 LIB_MIN=			0
 
-- 
1.6.4.2

