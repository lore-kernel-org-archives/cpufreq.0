From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/4] libcpupower: libcpufreq: Provide boost information also for AMD family 12h and 15h
Date: Tue,  1 Feb 2011 16:11:43 +0100
Message-ID: <c415675017a84c013931e1ee0797468c1107ed33.1296572755.git.trenn@suse.de>
References: <cover.1296572755.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1296572755.git.trenn@suse.de>
In-Reply-To: <cover.1296572755.git.trenn@suse.de>
References: <cover.1296572755.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, herrmann.der.user@googlemail.com, Thomas Renninger <trenn@suse.de>

From: Andreas Herrmann <herrmann.der.user@googlemail.com>

Signed-off-by: Andreas Herrmann <herrmann.der.user@googlemail.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Andreas Herrmann <herrmann.der.user@googlemail.com>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 lib/pci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/pci.c b/lib/pci.c
index 8887aa5..83d1581 100644
--- a/lib/pci.c
+++ b/lib/pci.c
@@ -66,7 +66,7 @@ int amd_pci_get_num_boost_states(int *active, int *states)
 {
 	struct pci_access *pci_acc;
 	int vendor_id = 0x1022;
-	int boost_dev_ids[2] = {0x1204, 0};
+	int boost_dev_ids[4] = {0x1204, 0x1504, 0x1704, 0};
 	struct pci_dev *device;
 	uint8_t val = 0;
 
@@ -82,7 +82,7 @@ int amd_pci_get_num_boost_states(int *active, int *states)
 		*active = 1;
 	else
 		*active = 0;
-	*states = (val >> 2) & 1;
+	*states = (val >> 2) & 7;
 
 	pci_acc_cleanup(pci_acc);
 	return 0;
-- 
1.7.3.4

