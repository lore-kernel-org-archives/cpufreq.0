From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8 won't load on Athlon64
Date: Wed, 25 Aug 2004 11:31:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040825093156.GM29560@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8439913D5@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul.devriendt@amd.com, ajp@aripollak.com
Cc: cpufreq@www.linux.org.uk

Hi,

On Tue, Aug 24, 2004 at 11:21:33AM -0500, paul.devriendt@amd.com wrote:
> > > Sure, it's up here: http://stuff.ebnj.net/acpidmp.out.bz2
> > 
> > A (quick) decodage by hand show there is 3 P-states, which contains
> > those settings:
> > 
> > freq: 1600000    voltage 950
> > freq: 1400000    voltage 950
> > freq: 1200000    voltage 950

Actually, the correct values are:

ACPI P-state 0
freq  1600  power 24040   latency 125  bus latency   6 control 0x06432308  status 0x00000308
      freq: 1600000    voltage 1250
      irt: 0    rvo 0   pllock 100 vidmvs 1   vstable 100
ACPI P-state 1
freq  1400  power     0   latency 125  bus latency   6 control 0x06432306  status 0x00000306
      freq: 1400000    voltage 1250
      irt: 0    rvo 0   pllock 100 vidmvs 1   vstable 100
ACPI P-state 2
freq  1200  power 18880   latency 125  bus latency   6 control 0x06432304  status 0x00000304
      freq: 1200000    voltage 1250
      irt: 0    rvo 0   pllock 100 vidmvs 1   vstable 100

sorry..

> > 
> > Voltage don't change (weird), and all frequencies are below 
> > 1.6GHz, so there
> > are all 'low'...  Those values are indeed completely bogus..
> > Complain to the bios writter (and ask Paul to give you some 
> > better tables
> > for overriding purposes.  He like to give them ;)
> Thanks Bruno, I had pulled the file down but had not gotten 
> around to looking at it yet. Those values are not going to
> work ... I am sticking with my guess of leftover K7 stuff.
> 
> AMD publishes the frequency/voltage info for Athlon64 ... you
> do not need to ask me ;) It is on AMD's web site, in the Power 
> and Thermal Data Sheet, document number 30430.
> 

Ok..  I think then an override with the below patch is OK for the
amd64 3000+ (with 512ko L2 cache).
I'm not sure for this part (I've taken them from an ACPI DSDT):

	data->irt = 3;
	data->rvo = 2;
	data->plllock = 2;
	data->vidmvs = 1;
	data->vstable = 5;

Paul, could you please confirm those values?



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
+	/* 2000 GHz  1.50V */
+	fid = 0xc;
+	vid = 2;
+	dprintk(KERN_INFO PFX "   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
+	powernow_table[0].index = fid; /* lower 8 bits */
+	powernow_table[0].index |= (vid << 8); /* upper 8 bits */
+	powernow_table[0].frequency = find_khz_freq_from_fid(fid);
+
+	/* 1800 GHz  1.40V */
+	fid = 0xa;
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




Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
