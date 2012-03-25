From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 01/13] cpupower: Better interface for accessing AMD pci registers
Date: Sun, 25 Mar 2012 20:38:42 +0200
Message-ID: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120325183807.GA26398@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, Andreas Herrmann <herrmann.der.user@googlemail.com>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Thomas Renninger <trenn@suse.de>

AMD's BKDG (Bios and Kernel Developers Guide) talks in the CPU spec of their
CPU families about PCI registers defined by "device" (slot) and func(tion).

Assuming that CPU specific configuration PCI devices are always on domain
and bus zero a pci_slot_func_init() func which gets the slot and func of
the desired PCI device passed looks like the most convenient way.

This also obsoletes the PCI device id maintenance.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Andreas Herrmann <herrmann.der.user@googlemail.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/utils/helpers/amd.c           |    4 +--
 tools/power/cpupower/utils/helpers/helpers.h       |    7 +++-
 tools/power/cpupower/utils/helpers/pci.c           |   35 +++++++++++++-------
 .../cpupower/utils/idle_monitor/amd_fam14h_idle.c  |    9 ++---
 4 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/amd.c b/tools/power/cpupower/utils/helpers/amd.c
index 87d5605..6437ef3 100644
--- a/tools/power/cpupower/utils/helpers/amd.c
+++ b/tools/power/cpupower/utils/helpers/amd.c
@@ -112,14 +112,12 @@ int decode_pstates(unsigned int cpu, unsigned int cpu_family,
 int amd_pci_get_num_boost_states(int *active, int *states)
 {
 	struct pci_access *pci_acc;
-	int vendor_id = 0x1022;
-	int boost_dev_ids[4] = {0x1204, 0x1604, 0x1704, 0};
 	struct pci_dev *device;
 	uint8_t val = 0;
 
 	*active = *states = 0;
 
-	device = pci_acc_init(&pci_acc, vendor_id, boost_dev_ids);
+	device = pci_slot_func_init(&pci_acc, 0x18, 4);
 
 	if (device == NULL)
 		return -ENODEV;
diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index 2747e73..6280daa 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -132,8 +132,11 @@ extern unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu);
 
 /* PCI stuff ****************************/
 extern int amd_pci_get_num_boost_states(int *active, int *states);
-extern struct pci_dev *pci_acc_init(struct pci_access **pacc, int vendor_id,
-				    int *dev_ids);
+extern struct pci_dev *pci_acc_init(struct pci_access **pacc, int domain,
+				    int bus, int slot, int func, int vendor,
+				    int dev);
+extern struct pci_dev *pci_slot_func_init(struct pci_access **pacc,
+					      int slot, int func);
 
 /* PCI stuff ****************************/
 
diff --git a/tools/power/cpupower/utils/helpers/pci.c b/tools/power/cpupower/utils/helpers/pci.c
index cd2eb6f..9690798 100644
--- a/tools/power/cpupower/utils/helpers/pci.c
+++ b/tools/power/cpupower/utils/helpers/pci.c
@@ -10,19 +10,24 @@
  * **pacc : if a valid pci_dev is returned
  *         *pacc must be passed to pci_acc_cleanup to free it
  *
- * vendor_id : the pci vendor id matching the pci device to access
- * dev_ids :   device ids matching the pci device to access
+ * domain: domain
+ * bus:    bus
+ * slot:   slot
+ * func:   func
+ * vendor: vendor
+ * device: device
+ * Pass -1 for one of the six above to match any
  *
  * Returns :
  * struct pci_dev which can be used with pci_{read,write}_* functions
  *                to access the PCI config space of matching pci devices
  */
-struct pci_dev *pci_acc_init(struct pci_access **pacc, int vendor_id,
-				    int *dev_ids)
+struct pci_dev *pci_acc_init(struct pci_access **pacc, int domain, int bus,
+			     int slot, int func, int vendor, int dev)
 {
-	struct pci_filter filter_nb_link = { -1, -1, -1, -1, vendor_id, 0};
+	struct pci_filter filter_nb_link = { domain, bus, slot, func,
+					     vendor, dev };
 	struct pci_dev *device;
-	unsigned int i;
 
 	*pacc = pci_alloc();
 	if (*pacc == NULL)
@@ -31,14 +36,20 @@ struct pci_dev *pci_acc_init(struct pci_access **pacc, int vendor_id,
 	pci_init(*pacc);
 	pci_scan_bus(*pacc);
 
-	for (i = 0; dev_ids[i] != 0; i++) {
-		filter_nb_link.device = dev_ids[i];
-		for (device = (*pacc)->devices; device; device = device->next) {
-			if (pci_filter_match(&filter_nb_link, device))
-				return device;
-		}
+	for (device = (*pacc)->devices; device; device = device->next) {
+		if (pci_filter_match(&filter_nb_link, device))
+			return device;
 	}
 	pci_cleanup(*pacc);
 	return NULL;
 }
+
+/* Typically one wants to get a specific slot(device)/func of the root domain
+   and bus */
+struct pci_dev *pci_slot_func_init(struct pci_access **pacc, int slot,
+				       int func)
+{
+	return pci_acc_init(pacc, 0, 0, slot, func, -1, -1);
+}
+
 #endif /* defined(__i386__) || defined(__x86_64__) */
diff --git a/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c b/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
index 202e555..108108d 100644
--- a/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
+++ b/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
@@ -20,8 +20,6 @@
 #include "idle_monitor/cpupower-monitor.h"
 #include "helpers/helpers.h"
 
-/******** PCI parts could go into own file and get shared ***************/
-
 #define PCI_NON_PC0_OFFSET	0xb0
 #define PCI_PC1_OFFSET		0xb4
 #define PCI_PC6_OFFSET		0xb8
@@ -82,10 +80,7 @@ static cstate_t amd_fam14h_cstates[AMD_FAM14H_STATE_NUM] = {
 };
 
 static struct pci_access *pci_acc;
-static int pci_vendor_id = 0x1022;
-static int pci_dev_ids[2] = {0x1716, 0};
 static struct pci_dev *amd_fam14h_pci_dev;
-
 static int nbp1_entered;
 
 struct timespec start_time;
@@ -303,7 +298,9 @@ struct cpuidle_monitor *amd_fam14h_register(void)
 					      sizeof(unsigned long long));
 	}
 
-	amd_fam14h_pci_dev = pci_acc_init(&pci_acc, pci_vendor_id, pci_dev_ids);
+	/* We need PCI device: Slot 18, Func 6, compare with BKDG
+	   for fam 12h/14h */
+	amd_fam14h_pci_dev = pci_slot_func_init(&pci_acc, 0x18, 6);
 	if (amd_fam14h_pci_dev == NULL || pci_acc == NULL)
 		return NULL;
 
-- 
1.7.5.4

