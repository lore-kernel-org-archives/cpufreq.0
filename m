From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 19:58:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209185831.GG13262@poupinou.org>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
	<20040209175000.GE13262@poupinou.org>
	<20040209180553.GA30914@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209180553.GA30914@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Mon, Feb 09, 2004 at 07:05:53PM +0100, Dominik Brodowski wrote:
> On Mon, Feb 09, 2004 at 06:50:00PM +0100, Bruno Ducrot wrote:
> > 
> > How about that one?
> 
> Looks much better, IMO.
> 
> >  By now, I'm a little puzzled with the fsb stuff,
> > though.  A first idea may be to look into what say ACPI about the
> > frequency, and deduce the fsb from, but I don't like it.
> 
> So you wouldn't like
> 
> 	fsb = (acpi_processor_perf->states[i].core_frequency * 10) / fid_codes[fid]
> 

Ok, you win.  That one is ok ?


--- linux-2.6.3-bk-acpi/arch/i386/kernel/cpu/cpufreq/powernow-k7.c.orig	2004-02-09 19:39:41.000000000 +0100
+++ linux-2.6.3-bk-acpi/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-02-09 19:58:28.000000000 +0100
@@ -333,6 +333,7 @@
 {
 	int i;
 	int retval = 0;
+	union powernow_acpi_control_t pc;
 
 	if (acpi_processor_perf != NULL)
 		return -EINVAL;
@@ -378,12 +379,22 @@
 
 	memset(powernow_table, 0, ((number_scales + 1) * sizeof(struct cpufreq_frequency_table)));
 
-	fsb = 100;	/* XXX fix me */
+	pc.val = (unsigned long) acpi_processor_perf->states[0].control;
+	fsb = (10 * (u32) acpi_processor_perf->states[0].core_frequency) / (fid_codes[pc.bits.fid]);
+	if (fsb > 133)
+		fsb = 133;
+	if (fsb < 100)
+		fsb = 100;
+
+	if (100 + 133 < 2*fsb)
+		fsb = 133;
+	else
+		fsb = 100;
+
 	latency = 0;
 
 	for (i = 0; i < number_scales; i++) {
 		u8 fid, vid;
-		union powernow_acpi_control_t pc;
 		unsigned int speed;
 
 		pc.val = (unsigned long) acpi_processor_perf->states[i].control;


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
