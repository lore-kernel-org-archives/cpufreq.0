From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 manual voltage selection ?
Date: Mon, 20 Dec 2004 17:58:08 +0100
Message-ID: <20041220165808.GQ2140@poupinou.org>
References: <E1CfpfX-000ID6-00.trx-inbox-ru@f17.mail.ru>
	<20041220141203.GO2140@poupinou.org> <41C6F43F.4000306@gmail.com>
	<20041220164504.GP2140@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="PuGuTyElPB9bOcsM"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041220164504.GP2140@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Nebojsa Trpkovic <trxman@gmail.com>
Cc: cpufreq@www.linux.org.uk


--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2004 at 05:45:04PM +0100, Bruno Ducrot wrote:
> 
> linux have been always conservative in mainline if running hardware
> out-of-spec AFAIK.

I forgot to attach this patch.  You have to modify it to suit your
needs, though.


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="powernow-k8.diff"

--- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004/08/24 13:49:16	1.1
+++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004/08/25 11:01:56
@@ -47,6 +47,9 @@
 
 static struct powernow_k8_data *powernow_data[NR_CPUS];
 
+
+#define OVERRIDE_MAX (3)
+
 /* Return a frequency in MHz, given an input fid */
 static u32 find_freq_from_fid(u32 fid)
 {
@@ -794,6 +797,68 @@
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index) { return; }
 #endif /* CONFIG_X86_POWERNOW_K8_ACPI */
 
+static int powernow_k8_cpu_init_override(struct powernow_k8_data *data)
+{
+	struct cpufreq_frequency_table *powernow_table;
+	u32 fid, vid;
+
+	/* fill in data->powernow_table */
+	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
+		* (OVERRIDE_MAX + 1)), GFP_KERNEL);
+	if (!powernow_table) {
+		dprintk(KERN_ERR PFX "powernow_table memory alloc failure\n");
+		goto err_out;
+	}
+
+	/* 2200 GHz  1.50V */
+	fid = 0xe;
+	vid = 2;
+	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
+	powernow_table[0].index = fid; /* lower 8 bits */
+	powernow_table[0].index |= (vid << 8); /* upper 8 bits */
+	powernow_table[0].frequency = find_khz_freq_from_fid(fid);
+
+	/* 2000 GHz  1.40V */
+	fid = 0xc;
+	vid = 6;
+	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
+	powernow_table[1].index = fid; /* lower 8 bits */
+	powernow_table[1].index |= (vid << 8); /* upper 8 bits */
+	powernow_table[1].frequency = find_khz_freq_from_fid(fid);
+
+	/* 1000 GHz  1.10V */
+	fid = 0x2;
+	vid = 0x12;
+	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
+	powernow_table[2].index = fid; /* lower 8 bits */
+	powernow_table[2].index |= (vid << 8); /* upper 8 bits */
+	powernow_table[2].frequency = find_khz_freq_from_fid(fid);
+
+	powernow_table[3].index = 0;
+	powernow_table[3].frequency = CPUFREQ_TABLE_END;
+
+	data->powernow_table = powernow_table;
+
+	/* fill in data */
+	data->numps = 3;
+	data->irt = 3;
+	data->rvo = 2;
+	data->plllock = 2;
+	data->vidmvs = 1;
+	data->vstable = 5;
+	data->acpi_data.state_count = 0;
+	print_basics(data);
+	return 0;
+
+err_out:
+	/*acpi_processor_unregister_performance(&data->acpi_data, data->cpu);*/
+
+	/* data->acpi_data.state_count informs us at ->exit() whether ACPI was used */
+	data->acpi_data.state_count = 0;
+
+	return -ENODEV;
+}
+
 /* Take a frequency, and issue the fid/vid transition command */
 static int transition_frequency(struct powernow_k8_data *data, unsigned int index)
 {
@@ -942,6 +1007,13 @@
 
 	data->cpu = pol->cpu;
 
+	if (powernow_k8_cpu_init_override(data)) {
+		printk(KERN_ERR PFX "Oops, can't override the powernow table for cpu %d\n", pol->cpu);
+		kfree(data);
+		return -ENODEV;
+	} else
+		goto the_next;
+
 	if (powernow_k8_cpu_init_acpi(data)) {
 		/*
 		 * Use the PSB BIOS structure. This is only availabe on
@@ -964,6 +1036,7 @@
 			return -ENODEV;
 		}
 	}
+the_next:
 
 	/* only run on specific CPU from here on */
 	oldmask = current->cpus_allowed;

--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--PuGuTyElPB9bOcsM--

