From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/8] Make linking quiet again
Date: Wed,  9 Feb 2011 14:56:33 +0100
Message-ID: <5672097bb2e1ff402df20cbc6f636bded720fdb9.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: lenb@kernel.org, andreas.herrmann3@amd.com, Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0386f53..510b10f 100644
--- a/Makefile
+++ b/Makefile
@@ -163,7 +163,7 @@ lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
 
 libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
-	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ -l pci \
+	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ -l pci \
 		-Wl,-soname,libcpupower.so.$(LIB_MIN) $(LIB_OBJS)
 	@ln -sf $@ libcpupower.so
 	@ln -sf $@ libcpupower.so.$(LIB_MIN)
@@ -171,7 +171,7 @@ libcpupower.so.$(LIB_MAJ): $(LIB_OBJS)
 # Still Provide the old lib, but apps should get fixed to
 # not link against it anymore
 libcpufreq.so.$(LIB_MAJ): libcpupower.so.$(LIB_MAJ)
-	$(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
+	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
 		-Wl,-soname,libcpufreq.so.$(LIB_MIN) -l cpupower -L .
 	@ln -sf $@ libcpufreq.so
 	@ln -sf $@ libcpufreq.so.$(LIB_MIN)
-- 
1.7.3.4

