From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH >=2.6.4] single-line,
	but KERN_WARNING message in p4-clockmod
Date: Sat, 14 Feb 2004 19:23:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040214182330.GA5097@dominikbrodowski.de>
References: <20040214160105.GA7747@dominikbrodowski.de>
	<20040214164142.GA29606@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040214164142.GA29606@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Sat, Feb 14, 2004 at 04:41:42PM +0000, Dave Jones wrote:
> I'd rather keep them multi-line in the source. It looks a lot more readable than just
> one line IMHO. I've no objection to killing off the \n's though.

As Pavel Machek told me, a single line warning is better, and KERN_DEBUG might
be missed if reading from /var/log/messages. As Dave Jones told me, multi-line
printk's are more readable, though.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-14 19:22:23.907928496 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-14 19:18:37.167398296 +0100
@@ -181,21 +181,24 @@
 {
 	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
 		/* Pentium M */
-		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
-		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium M detected. ");
+		printk("The speedstep_centrino module offers voltage scaling");
+		printk(" in addition of frequency scaling. You should use ");
+		printk("that instead of p4-clockmod, if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
 		return 0;
 	}
 
 	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
-		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
-		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. ");
+		printk("The speedstep-ich or acpi cpufreq modules offers ");
+		printk("voltage scaling in addition of frequency scaling. ");
+		printk("You should use either one instead of p4-clockmod, ");
+		printk("if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 	}
