From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Cpufreq for opteron
Date: Thu, 4 Sep 2003 12:00:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904100002.GB20816@brodo.de>
References: <99F2150714F93F448942F9A9F112634C080EF034@txexmtae.amd.com>
	<20030827051356.GA4037@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030827051356.GA4037@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: paul.devriendt@AMD.com
Cc: pavel@suse.cz, richard.brunner@AMD.com, aj@suse.de, cpufreq@www.linux.org.uk, davej@redhat.com, mark.langsdorf@AMD.com


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul, Mark, Pavel,

attached are a couple of patches for powernow-k8 v. 07 in its 2.6. variant
[such as Paul sent me a few days ago]. All patches are compile-tested only
as I don't have the necessary hardware :-(

core_updates
	- some cpufreq core updates [in cpufreq BK already] make this change
		necessary.

freq_table_1
	- introduce a struct cpufreq_frequency_table *powernow_table
	- Fill it with contents: in its ->frequency field the frequency is
		written, its ->index field has the fid in the lowest 8 bits,
		and the vid in the next upper 8 bits.
	- use cpufreq_frequency_table_verify instead of own code in
		drv_verify. cpufreq_frequency_table_verify walks the
		powernow_table and assures that
		a) policy->min >= lowest supported frequency
		b) policy->max >= highest supported frequency
		c) one supported frequency is within policy->min and
		   policy->max
	- use cpufreq_frequency_table_cpuinfo instead of own code in
		drv_cpu_init. It sets the pol->cpuinfo.{min,max}_freq values
		according to the powernow_table.

freq_table_2
	- use cpufreq_frequency_table_target to determine the best
		frequency. It walks the powernow_table, and is aware of all
		cpufreq core semantics. Decode the new vid and fid from
		the powernow_table.
	- remove find_match as it's not needed any longer.

freq_table_3
	- remove the batterypstates code as it should be done in the ACPI
		processor driver using a cpufreq notifier (will be done
		later)
	- remove unneeded find_closest_fid
	- ppst is only used in find_pst_table any more

freq_table_4
	- move definition of cpufreq_amd64_driver to the bottom -- saves a
		couple of definitions in powernow-k8.h
	- change the driver name to "powernow-k8"
	- remove unneeded find_fid_from_freq
	- remove sort_pst
	- make BIOS tests with pst instead of ppst
		only the "only one entry for one frequency" check is
		removed, all others are only moved.

freq_table_5
	- move BIOS tests to check_pst_table


Please check these patches, and -if appropriate- merge them into your
driver.

	Dominik

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-core_updates"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:31:31.470659376 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:30:36.677989128 +0200
@@ -1014,7 +1014,7 @@
 		return -ENODEV;
 	}
 
-	pol->policy = CPUFREQ_POLICY_PERFORMANCE;	/* boot as fast as we can */
+	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/* Take a crude guess here. 8 vid transitions plus 3 fid transitions seems reasonable. */
 	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-freq_table_1"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:47:10.791860848 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:48:54.710062880 +0200
@@ -47,6 +47,8 @@
 static u32 currvid;		/* keep track of what we think the current fid / vid are */
 static u32 currfid;
 
+static struct cpufreq_frequency_table *powernow_table;
+
 /*
 The PSB table supplied by BIOS allows for the definition of the number of
 p-states that can be used when running on a/c, and the number of p-states
@@ -675,6 +677,12 @@
 				return -ENODEV;
 			}
 
+			powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (numpstates + 1)), GFP_KERNEL);
+			if (!powernow_table) {
+				printk(KERN_ERR PFX "powernow_table memory alloc failure\n");
+				return -ENOMEM;
+			}
+
 			ppst =
 			    kmalloc(sizeof (struct pst_s) * numpstates,
 				    GFP_KERNEL);
@@ -691,7 +699,14 @@
 				printk(KERN_INFO PFX
 				       "   %d : fid 0x%x, vid 0x%x\n", j,
 				       ppst[j].fid, ppst[j].vid);
+
+				powernow_table[j].index = pst[j].fid; /* lower 8 bits */
+				powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
+				powernow_table[j].frequency = find_freq_from_fid(pst[j].fid);
 			}
+			powernow_table[numpstates].frequency = CPUFREQ_TABLE_END;
+			powernow_table[numpstates].index = 0;
+
 			sort_pst(ppst, numpstates);
 
 			lastfid = ppst[0].fid;
@@ -705,6 +720,7 @@
 				       "first fid/vid invalid (0x%x - 0x%x)\n",
 				       lastfid, ppst[0].vid);
 				kfree(ppst);
+				kfree(powernow_table);
 				ppst = NULL;
 				return -ENODEV;
 			}
@@ -719,6 +735,7 @@
 					       "BIOS error - invalid fid/vid in pst(%x %x)\n",
 					       ppst[j].fid, ppst[j].vid);
 					kfree(ppst);
+					kfree(powernow_table);
 					ppst = NULL;
 					return -ENODEV;
 				}
@@ -742,6 +759,7 @@
 
 			if (query_current_values_with_pending_wait()) {
 				kfree(ppst);
+				kfree(powernow_table);
 				ppst = NULL;
 				return 1;
 			}
@@ -967,42 +985,12 @@
 static int
 drv_verify(struct cpufreq_policy *pol)
 {
-	u32 min = pol->min / 1000;
-	u32 max = pol->max / 1000;
-	u32 targ = min;
-	int res;
-
-	if (ppst == 0) {
-		printk(KERN_ERR PFX "verify - ppst 0\n");
-		return -ENODEV;
-	}
-
 	if (pending_bit_stuck()) {
 		printk(KERN_ERR PFX "failing verify, change pending bit set\n");
 		return -EIO;
 	}
 
-	dprintk(KERN_DEBUG PFX
-		"ver: cpu%d, min %d, max %d, cur %d, pol %d (%s)\n", pol->cpu,
-		pol->min, pol->max, pol->cur, pol->policy,
-		pol->policy ==
-		CPUFREQ_POLICY_POWERSAVE ? "psave" : pol->policy ==
-		CPUFREQ_POLICY_PERFORMANCE ? "perf" : "unk");
-
-	if (pol->cpu != 0) {
-		printk(KERN_ERR PFX "verify - cpu not 0\n");
-		return -ENODEV;
-	}
-
-	res = find_match(&targ, &min, &max,
-			 pol->policy ==
-			 CPUFREQ_POLICY_POWERSAVE ? SEARCH_DOWN : SEARCH_UP, 0,
-			 0);
-	if (!res) {
-		pol->min = min * 1000;
-		pol->max = max * 1000;
-	}
-	return res;
+	return cpufreq_frequency_table_verify(pol, powernow_table);
 }
 
 /* per CPU init entry point to the driver */
@@ -1028,13 +1016,17 @@
 	dprintk(KERN_DEBUG PFX "policy current frequency %d kHz\n", pol->cur);
 
 	/* min/max the cpu is capable of */
-	pol->cpuinfo.min_freq = 1000 * find_freq_from_fid(ppst[0].fid);
-	pol->cpuinfo.max_freq =
-	    1000 * find_freq_from_fid(ppst[numpstates - 1].fid);
+	if (cpufreq_frequency_table_cpuinfo(pol, powernow_table)) {
+		printk(KERN_ERR PFX "invalid powernow_table\n");
+		kfree(powernow_table);
+		return -EINVAL;
+	}
 
-	pol->min = 1000 * find_freq_from_fid(ppst[0].fid);
 	pol->max = 1000 * find_freq_from_fid(ppst[batterypstates - 1].fid);
 
+	if (!ppst)
+		return -EINVAL;;
+
 	printk(KERN_INFO PFX "cpu_init done, current fid 0x%x, vid 0x%x\n",
 	       currfid, currvid);
 

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-freq_table_2"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:49:04.872517952 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 10:57:16.978706440 +0200
@@ -801,96 +801,23 @@
 	return find_fid_from_freq(freq);
 }
 
-/* Takes a target freq and a range, and finds a suitable freq and range to match */
-static int
-find_match(u32 * ptargfreq, u32 * pmin, u32 * pmax, int searchup, u32 * pfid,
-	   u32 * pvid)
-{
-	u32 availpstates = batterypstates;
-	u32 targfid = find_closest_fid(*ptargfreq, searchup);
-	u32 minfid = find_closest_fid(*pmin, SEARCH_DOWN);
-	u32 maxfid = find_closest_fid(*pmax, SEARCH_UP);
-	u32 minidx = 0;
-	u32 maxidx = availpstates - 1;
-	u32 targidx = 0xffffffff;
-	int i;
-
-	dprintk(KERN_DEBUG PFX "find match: freq %d MHz, min %d, max %d\n",
-		*ptargfreq, *pmin, *pmax);
-
-	/* Restrict values to the frequency choices in the PST */
-	if (minfid < ppst[0].fid)
-		minfid = ppst[0].fid;
-	if (maxfid > ppst[maxidx].fid)
-		maxfid = ppst[maxidx].fid;
-
-	/* Find appropriate PST index for the minimim fid */
-	for (i = 0; i < (int) availpstates; i++) {
-		if (minfid >= ppst[i].fid)
-			minidx = i;
-	}
-
-	/* Find appropriate PST index for the maximum fid */
-	for (i = availpstates - 1; i >= 0; i--) {
-		if (maxfid <= ppst[i].fid)
-			maxidx = i;
-	}
-
-	if (minidx > maxidx)
-		maxidx = minidx;
-
-	/* Frequency ids are now constrained by limits matching PST entries */
-	minfid = ppst[minidx].fid;
-	maxfid = ppst[maxidx].fid;
-
-	/* Limit the target frequency to these limits */
-	if (targfid < minfid)
-		targfid = minfid;
-	else if (targfid > maxfid)
-		targfid = maxfid;
-
-	/* Find the best target index into the PST, contrained by the range */
-	if (searchup == SEARCH_UP) {
-		for (i = maxidx; i >= (int) minidx; i--) {
-			if (targfid <= ppst[i].fid)
-				targidx = i;
-		}
-	} else {
-		for (i = minidx; i <= (int) maxidx; i++) {
-			if (targfid >= ppst[i].fid)
-				targidx = i;
-		}
-	}
-
-	if (targidx == 0xffffffff) {
-		printk(KERN_ERR PFX "could not find target\n");
-		return 1;
-	}
-
-	*pmin = find_freq_from_fid(minfid);
-	*pmax = find_freq_from_fid(maxfid);
-	*ptargfreq = find_freq_from_fid(ppst[targidx].fid);
-
-	if (pfid)
-		*pfid = ppst[targidx].fid;
-	if (pvid)
-		*pvid = ppst[targidx].vid;
-
-	return 0;
-}
-
 /* Take a frequency, and issue the fid/vid transition command */
 static inline int
-transition_frequency(u32 * preq, u32 * pmin, u32 * pmax, u32 searchup)
+transition_frequency(unsigned int index)
 {
 	u32 fid;
 	u32 vid;
 	int res;
 	struct cpufreq_freqs freqs;
 
-	if (find_match(preq, pmin, pmax, searchup, &fid, &vid)) {
-		return 1;
-	}
+	/* fid are the lower 8 bits of the index we stored into
+	 * the cpufreq frequency table in find_psb_table, vid are 
+	 * the upper 8 bits.
+	 */
+
+	fid = powernow_table[index].index & 0xFF;
+	vid = (powernow_table[index].index & 0xFF00) >> 8;
+
 	dprintk(KERN_DEBUG PFX "table matched fid 0x%x, giving vid 0x%x\n", fid,
 		vid);
 
@@ -938,14 +865,7 @@
 {
 	u32 checkfid = currfid;
 	u32 checkvid = currvid;
-	u32 reqfreq = targfreq / 1000;
-	u32 minfreq = pol->min / 1000;
-	u32 maxfreq = pol->max / 1000;
-
-	if (ppst == 0) {
-		printk(KERN_ERR PFX "targ: ppst 0\n");
-		return -ENODEV;
-	}
+	unsigned int newstate;
 
 	if (pending_bit_stuck()) {
 		printk(KERN_ERR PFX
@@ -968,9 +888,10 @@
 		       checkfid, currfid, checkvid, currvid);
 	}
 
-	if (transition_frequency(&reqfreq, &minfreq, &maxfreq,
-				 relation ==
-				 CPUFREQ_RELATION_H ? SEARCH_UP : SEARCH_DOWN))
+	if (cpufreq_frequency_table_target(pol, powernow_table, targfreq, relation, &newstate))
+		return -EINVAL;
+	
+	if (transition_frequency(newstate))
 	{
 		printk(KERN_ERR PFX "transition frequency failed\n");
 		return 1;

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-freq_table_3"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:02:22.052328200 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:04:42.442985576 +0200
@@ -43,35 +43,11 @@
 static u32 rvo;			/* ramp voltage offset, from the PSB */
 static u32 irt;			/* isochronous relief time, from the PSB */
 static u32 vidmvs;		/* usable value calculated from mvs, which is in the PSB */
-struct pst_s *ppst;		/* array of p states, valid for this part */
 static u32 currvid;		/* keep track of what we think the current fid / vid are */
 static u32 currfid;
 
 static struct cpufreq_frequency_table *powernow_table;
 
-/*
-The PSB table supplied by BIOS allows for the definition of the number of
-p-states that can be used when running on a/c, and the number of p-states
-that can be used when running on battery. This allows laptop manufacturers
-to force the system to save power when running from battery. The relationship 
-is :
-   1 <= number_of_battery_p_states <= maximum_number_of_p_states
-
-This driver does NOT have the support in it to detect transitions from
-a/c power to battery power, and thus trigger the transition to a lower
-p-state if required. This is because I need ACPI and the 2.6 kernel to do 
-this, and this is a 2.4 kernel driver. Check back for a new improved driver
-for the 2.6 kernel soon.
-
-This code therefore assumes it is on battery at all times, and thus
-restricts performance to number_of_battery_p_states. For desktops, 
-  number_of_battery_p_states == maximum_number_of_pstates, 
-so this is not actually a restriction.
-*/
-
-static u32 batterypstates;	/* limit on the number of p states when on battery */
-				/* - set by BIOS in the PSB/PST                    */
-
 static struct cpufreq_driver cpufreq_amd64_driver = {
 	.verify = drv_verify,
 	.target = drv_target,
@@ -563,6 +539,7 @@
 {
 	struct psb_s *psb;
 	struct pst_s *pst;
+	struct pst_s *ppst;		/* array of p states, valid for this part */
 	unsigned i, j;
 	u32 lastfid;
 	u32 mvs;
@@ -603,23 +580,6 @@
 			irt = ((psb->flags2) >> 2) & 3;
 			mvs = ((psb->flags2) >> 4) & 3;
 			vidmvs = 1 << mvs;
-			batterypstates = ((psb->flags2) >> 6) & 3;
-			printk(KERN_INFO PFX "p states on battery: %d ",
-			       batterypstates);
-			switch (batterypstates) {
-			case 0:
-				printk("- all available\n");
-				break;
-			case 1:
-				printk("- only the minimum\n");
-				break;
-			case 2:
-				printk("- only the 2 lowest\n");
-				break;
-			case 3:
-				printk("- only the 3 lowest\n");
-				break;
-			}
 			printk(KERN_INFO PFX "ramp voltage offset: %d\n", rvo);
 			printk(KERN_INFO PFX "isochronous relief time: %d\n",
 			       irt);
@@ -656,27 +616,6 @@
 				return -ENODEV;
 			}
 
-			if (batterypstates == 0) {	/* all available */
-				batterypstates = numpstates;
-			} else if (batterypstates > numpstates) {
-				printk(KERN_ERR PFX
-				       "batterypstates > numpstates\n");
-				batterypstates = numpstates;
-			} else {
-				printk(KERN_ERR PFX
-				       "Restricting operation to %d p-states\n",
-				       batterypstates);
-				printk(KERN_ERR PFX
-				       "Check for an updated driver to access all %d p-states\n",
-				       numpstates);
-			}
-
-			if ((numpstates <= 1) || (batterypstates <= 1)) {
-				printk(KERN_ERR PFX
-				       "only 1 p-state, nothing to transition\n");
-				return -ENODEV;
-			}
-
 			powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (numpstates + 1)), GFP_KERNEL);
 			if (!powernow_table) {
 				printk(KERN_ERR PFX "powernow_table memory alloc failure\n");
@@ -769,12 +708,14 @@
 			for (j = 0; j < numpstates; j++) {
 				if ((ppst[j].fid == currfid)
 				    && (ppst[j].vid == currvid)) {
+					kfree(ppst);
 					return (0);
 				}
 			}
 
 			printk(KERN_ERR PFX
 			       "BIOS error, currfid/vid do not match PST, ignoring\n");
+			kfree(ppst);
 			return 0;
 		}
 	}
@@ -783,24 +724,6 @@
 	return -ENODEV;
 }
 
-/* Converts a frequency (that might not necessarily be a multiple of 200) to a fid */
-u32
-find_closest_fid(u32 freq, int searchup)
-{
-	if (searchup == SEARCH_UP) {
-		freq += MIN_FREQ_RESOLUTION - 1;
-	}
-	freq = (freq / MIN_FREQ_RESOLUTION) * MIN_FREQ_RESOLUTION;
-
-	if (freq < MIN_FREQ) {
-		freq = MIN_FREQ;
-	} else if (freq > MAX_FREQ) {
-		freq = MAX_FREQ;
-	}
-
-	return find_fid_from_freq(freq);
-}
-
 /* Take a frequency, and issue the fid/vid transition command */
 static inline int
 transition_frequency(unsigned int index)
@@ -943,11 +866,6 @@
 		return -EINVAL;
 	}
 
-	pol->max = 1000 * find_freq_from_fid(ppst[batterypstates - 1].fid);
-
-	if (!ppst)
-		return -EINVAL;;
-
 	printk(KERN_INFO PFX "cpu_init done, current fid 0x%x, vid 0x%x\n",
 	       currfid, currvid);
 
@@ -974,8 +892,6 @@
 	if (pending_bit_stuck()) {
 		printk(KERN_ERR PFX
 		       "failing driver init, change pending bit set\n");
-		kfree(ppst);
-		ppst = NULL;
 		return -EIO;
 	}
 
@@ -989,9 +905,6 @@
 	dprintk(KERN_INFO PFX "drv_exit\n");
 
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
-	if (ppst) {
-		kfree(ppst);
-	}
 }
 
 MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com>");

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-freq_table_4"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:26:21.542492432 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:30:53.376167432 +0200
@@ -48,31 +48,17 @@
 
 static struct cpufreq_frequency_table *powernow_table;
 
-static struct cpufreq_driver cpufreq_amd64_driver = {
-	.verify = drv_verify,
-	.target = drv_target,
-	.init = drv_cpu_init,
-	.name = "cpufreq-amd64",
-	.owner = THIS_MODULE,
-};
-
 #define SEARCH_UP     1
 #define SEARCH_DOWN   0
 
+
 /* Return a frequency in MHz, given an input fid */
-u32
+static u32
 find_freq_from_fid(u32 fid)
 {
 	return 800 + (fid * 100);
 }
 
-/* Return a fid matching an input frequency in MHz */
-u32
-find_fid_from_freq(u32 freq)
-{
-	return (freq - 800) / 100;
-}
-
 /* Return the vco fid for an input fid */
 static u32
 convert_fid_to_vco_fid(u32 fid)
@@ -84,37 +70,6 @@
 	}
 }
 
-/* Sort the fid/vid frequency table into ascending order by fid. The spec */
-/* implies that it will be sorted by BIOS, but, it only implies it, and I */
-/* prefer not to trust when I can check.                                  */
-/* Yes, it is a simple bubble sort, but the PST is really small, so the   */
-/* choice of algorithm is pretty irrelevant.                              */
-static inline void
-sort_pst(struct pst_s *ppst, u32 numpstates)
-{
-	u32 i;
-	u8 tempfid;
-	u8 tempvid;
-	int swaps = 1;
-
-	while (swaps) {
-		swaps = 0;
-		for (i = 0; i < (numpstates - 1); i++) {
-			if (ppst[i].fid > ppst[i + 1].fid) {
-				swaps = 1;
-				tempfid = ppst[i].fid;
-				tempvid = ppst[i].vid;
-				ppst[i].fid = ppst[i + 1].fid;
-				ppst[i].vid = ppst[i + 1].vid;
-				ppst[i + 1].fid = tempfid;
-				ppst[i + 1].vid = tempvid;
-			}
-		}
-	}
-
-	return;
-}
-
 /* Return 1 if the pending bit is set. Unless we are actually just told the processor */
 /* to transition a state, seeing this bit set is really bad news.                     */
 static inline int
@@ -539,7 +494,6 @@
 {
 	struct psb_s *psb;
 	struct pst_s *pst;
-	struct pst_s *ppst;		/* array of p states, valid for this part */
 	unsigned i, j;
 	u32 lastfid;
 	u32 mvs;
@@ -616,28 +570,52 @@
 				return -ENODEV;
 			}
 
+			pst = (struct pst_s *) (psb + 1);
+			lastfid = 0xFFFFFFFF;
+			for (j = 0; j < numpstates; j++) {
+				if (pst[j].vid > LEAST_VID) {
+					printk(KERN_ERR PFX "vid invalid : 0x%x\n", pst[j].vid);
+					return -EINVAL;
+				}
+				if (pst[j].vid < rvo) {	/* vid + rvo >= 0 */
+					printk(KERN_ERR PFX
+					       "BIOS error - 0 vid exceeded with pstate %d\n",
+					       j);
+					return -ENODEV;
+				}
+				if (pst[j].vid < maxvid + rvo) {	/* vid + rvo >= maxvid */
+					printk(KERN_ERR PFX
+					       "BIOS error - maxvid exceeded with pstate %d\n",
+					       j);
+					return -ENODEV;
+				}
+				if ((pst[j].fid > MAX_FID)
+				    || (pst[j].fid & 1)
+				    || (pst[j].fid < HI_FID_TABLE_BOTTOM)){
+					printk(KERN_ERR PFX "fid invalid : 0x%x\n", pst[j].fid);
+					return -EINVAL;
+				}
+				if (pst[j].fid < lastfid)
+					lastfid = pst[j].fid;
+			}
+			if (lastfid & 1) {
+				printk(KERN_ERR PFX "lastfid invalid\n");
+				return -EINVAL;
+			}
+			if (lastfid > LO_FID_TABLE_TOP) {
+				printk(KERN_INFO PFX  "first fid not from lo freq table\n");
+			}
+
 			powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (numpstates + 1)), GFP_KERNEL);
 			if (!powernow_table) {
 				printk(KERN_ERR PFX "powernow_table memory alloc failure\n");
 				return -ENOMEM;
 			}
 
-			ppst =
-			    kmalloc(sizeof (struct pst_s) * numpstates,
-				    GFP_KERNEL);
-			if (!ppst) {
-				printk(KERN_ERR PFX
-				       "ppst memory alloc failure\n");
-				return -ENOMEM;
-			}
-
-			pst = (struct pst_s *) (psb + 1);
 			for (j = 0; j < numpstates; j++) {
-				ppst[j].fid = pst[j].fid;
-				ppst[j].vid = pst[j].vid;
 				printk(KERN_INFO PFX
 				       "   %d : fid 0x%x, vid 0x%x\n", j,
-				       ppst[j].fid, ppst[j].vid);
+				       pst[j].fid, pst[j].vid);
 
 				powernow_table[j].index = pst[j].fid; /* lower 8 bits */
 				powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
@@ -646,76 +624,22 @@
 			powernow_table[numpstates].frequency = CPUFREQ_TABLE_END;
 			powernow_table[numpstates].index = 0;
 
-			sort_pst(ppst, numpstates);
-
-			lastfid = ppst[0].fid;
-			if (lastfid > LO_FID_TABLE_TOP) {
-				printk(KERN_INFO PFX
-				       "first fid not from lo freq table\n");
-			}
-			if ((lastfid > MAX_FID) || (lastfid & 1)
-			    || (ppst[0].vid > LEAST_VID)) {
-				printk(KERN_ERR PFX
-				       "first fid/vid invalid (0x%x - 0x%x)\n",
-				       lastfid, ppst[0].vid);
-				kfree(ppst);
-				kfree(powernow_table);
-				ppst = NULL;
-				return -ENODEV;
-			}
-
-			for (j = 1; j < numpstates; j++) {
-				if ((lastfid >= ppst[j].fid)
-				    || (ppst[j].fid & 1)
-				    || (ppst[j].fid < HI_FID_TABLE_BOTTOM)
-				    || (ppst[j].fid > MAX_FID)
-				    || (ppst[j].vid > LEAST_VID)) {
-					printk(KERN_ERR PFX
-					       "BIOS error - invalid fid/vid in pst(%x %x)\n",
-					       ppst[j].fid, ppst[j].vid);
-					kfree(ppst);
-					kfree(powernow_table);
-					ppst = NULL;
-					return -ENODEV;
-				}
-				lastfid = ppst[j].fid;
-			}
-
-			for (j = 0; j < numpstates; j++) {
-				if (ppst[j].vid < rvo) {	/* vid + rvo >= 0 */
-					printk(KERN_ERR PFX
-					       "BIOS error - 0 vid exceeded with pstate %d\n",
-					       j);
-					return -ENODEV;
-				}
-				if (ppst[j].vid < maxvid + rvo) {	/* vid + rvo >= maxvid */
-					printk(KERN_ERR PFX
-					       "BIOS error - maxvid exceeded with pstate %d\n",
-					       j);
-					return -ENODEV;
-				}
-			}
-
 			if (query_current_values_with_pending_wait()) {
-				kfree(ppst);
 				kfree(powernow_table);
-				ppst = NULL;
 				return 1;
 			}
 			printk(KERN_INFO PFX "currfid 0x%x, currvid 0x%x\n",
 			       currfid, currvid);
 
 			for (j = 0; j < numpstates; j++) {
-				if ((ppst[j].fid == currfid)
-				    && (ppst[j].vid == currvid)) {
-					kfree(ppst);
+				if ((pst[j].fid == currfid)
+				    && (pst[j].vid == currvid)) {
 					return (0);
 				}
 			}
 
 			printk(KERN_ERR PFX
 			       "BIOS error, currfid/vid do not match PST, ignoring\n");
-			kfree(ppst);
 			return 0;
 		}
 	}
@@ -872,6 +796,28 @@
 	return 0;
 }
 
+
+static int __exit drv_cpu_exit (struct cpufreq_policy *pol)
+{
+	if (pol->cpu != 0)
+		return -EINVAL;
+
+	if (powernow_table)
+		kfree(powernow_table);
+
+	return 0;
+}
+
+static struct cpufreq_driver cpufreq_amd64_driver = {
+	.verify = drv_verify,
+	.target = drv_target,
+	.init = drv_cpu_init,
+	.exit = drv_cpu_exit,
+	.name = "powernow-k8",
+	.owner = THIS_MODULE,
+};
+
+
 /* driver entry point for init */
 static int __init
 drv_init(void)
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.h linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.h
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2003-09-04 10:31:31.470659376 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2003-09-04 11:06:31.684378360 +0200
@@ -118,8 +118,3 @@
 static inline int core_voltage_pre_transition(u32 reqvid);
 static inline int core_voltage_post_transition(u32 reqvid);
 static inline int core_frequency_transition(u32 reqfid);
-static int drv_verify(struct cpufreq_policy *pol);
-static int drv_target(struct cpufreq_policy *pol, unsigned targfreq,
-		      unsigned relation);
-static int __init drv_cpu_init(struct cpufreq_policy *pol);
-static void __exit drv_exit(void);

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="powernow-k8-2.6.0-test4-freq_table_5"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:37:41.190170280 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-09-04 11:41:42.571474744 +0200
@@ -48,10 +48,6 @@
 
 static struct cpufreq_frequency_table *powernow_table;
 
-#define SEARCH_UP     1
-#define SEARCH_DOWN   0
-
-
 /* Return a frequency in MHz, given an input fid */
 static u32
 find_freq_from_fid(u32 fid)
@@ -488,14 +484,55 @@
 	return 1;
 }
 
+static int check_pst_table(struct pst_s *pst, u8 maxvid)
+{
+	unsigned int j;
+	u8 lastfid = 0xFF;
+
+	for (j = 0; j < numpstates; j++) {
+		if (pst[j].vid > LEAST_VID) {
+			printk(KERN_ERR PFX "vid %d invalid : 0x%x\n", j, pst[j].vid);
+			return -EINVAL;
+		}
+		if (pst[j].vid < rvo) {	/* vid + rvo >= 0 */
+			printk(KERN_ERR PFX
+			       "BIOS error - 0 vid exceeded with pstate %d\n",
+			       j);
+			return -ENODEV;
+		}
+		if (pst[j].vid < maxvid + rvo) {	/* vid + rvo >= maxvid */
+			printk(KERN_ERR PFX
+			       "BIOS error - maxvid exceeded with pstate %d\n",
+			       j);
+			return -ENODEV;
+		}
+		if ((pst[j].fid > MAX_FID)
+		    || (pst[j].fid & 1)
+		    || (pst[j].fid < HI_FID_TABLE_BOTTOM)){
+			printk(KERN_ERR PFX "fid %d invalid : 0x%x\n", j, pst[j].fid);
+			return -EINVAL;
+		}
+		if (pst[j].fid < lastfid)
+			lastfid = pst[j].fid;
+	}
+	if (lastfid & 1) {
+		printk(KERN_ERR PFX "lastfid invalid\n");
+		return -EINVAL;
+	}
+	if (lastfid > LO_FID_TABLE_TOP) {
+		printk(KERN_INFO PFX  "first fid not from lo freq table\n");
+	}
+
+	return 0;
+}
+
 /* Find and validate the PSB/PST table in BIOS. */
 static inline int
 find_psb_table(void)
 {
 	struct psb_s *psb;
 	struct pst_s *pst;
-	unsigned i, j;
-	u32 lastfid;
+	unsigned int i, j;
 	u32 mvs;
 	u8 maxvid;
 
@@ -571,40 +608,8 @@
 			}
 
 			pst = (struct pst_s *) (psb + 1);
-			lastfid = 0xFFFFFFFF;
-			for (j = 0; j < numpstates; j++) {
-				if (pst[j].vid > LEAST_VID) {
-					printk(KERN_ERR PFX "vid invalid : 0x%x\n", pst[j].vid);
-					return -EINVAL;
-				}
-				if (pst[j].vid < rvo) {	/* vid + rvo >= 0 */
-					printk(KERN_ERR PFX
-					       "BIOS error - 0 vid exceeded with pstate %d\n",
-					       j);
-					return -ENODEV;
-				}
-				if (pst[j].vid < maxvid + rvo) {	/* vid + rvo >= maxvid */
-					printk(KERN_ERR PFX
-					       "BIOS error - maxvid exceeded with pstate %d\n",
-					       j);
-					return -ENODEV;
-				}
-				if ((pst[j].fid > MAX_FID)
-				    || (pst[j].fid & 1)
-				    || (pst[j].fid < HI_FID_TABLE_BOTTOM)){
-					printk(KERN_ERR PFX "fid invalid : 0x%x\n", pst[j].fid);
-					return -EINVAL;
-				}
-				if (pst[j].fid < lastfid)
-					lastfid = pst[j].fid;
-			}
-			if (lastfid & 1) {
-				printk(KERN_ERR PFX "lastfid invalid\n");
+			if (check_pst_table(pst, maxvid))
 				return -EINVAL;
-			}
-			if (lastfid > LO_FID_TABLE_TOP) {
-				printk(KERN_INFO PFX  "first fid not from lo freq table\n");
-			}
 
 			powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (numpstates + 1)), GFP_KERNEL);
 			if (!powernow_table) {

--gKMricLos+KVdGMg
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--gKMricLos+KVdGMg--

