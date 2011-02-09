From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/8] libcpupower: libcpufreq: Provide boost information also for AMD family 12h and 15h
Date: Wed,  9 Feb 2011 14:56:34 +0100
Message-ID: <328fea9c7ff38f5dca864d0acaf077b40825b307.1297259254.git.trenn@suse.de>
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
Cc: lenb@kernel.org, andreas.herrmann3@amd.com, Andreas Herrmann <herrmann.der.user@googlemail.com>, Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

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
index 8887aa5..2304e4d 100644
--- a/lib/pci.c
+++ b/lib/pci.c
@@ -66,7 +66,7 @@ int amd_pci_get_num_boost_states(int *active, int *states)
 {
 	struct pci_access *pci_acc;
 	int vendor_id = 0x1022;
-	int boost_dev_ids[2] = {0x1204, 0};
+	int boost_dev_ids[4] = {0x1204, 0x1604, 0x1704, 0};
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

