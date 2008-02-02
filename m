From: Woody Suwalski <woody@suwalski.net>
Subject: Processor 6 model 0x16
Date: Sat, 02 Feb 2008 14:52:54 -0500
Message-ID: <47A4CA16.3040802@suwalski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Howdy, I have recently got a prototype MB from ASUS with the unsupported 
processor (probably new ;-) ).
Printk's at the beginning of cpufreq_p4_get_frequency function show 
x86=0x06 and x86_model=0x16.
The processor is unmarked, but looks similar to current PentiumM 
processors (but then maybe all processors are packaged same way?)

What would be the safe(est) sequence of tests: say start with case 0x09 
AND 0x16
or skip Banias and try Dothan to start?
Or no point - all current Intel stuf should be more or less Core comaptible?

Thanks, Woody Suwalski
Ottawa

PS. The board is in the office, so I can not give you more details till 
Monday...


static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
{
        if (c->x86 == 0x06) {
                if (cpu_has(c, X86_FEATURE_EST))
                        printk(KERN_WARNING PFX "Warning: EST-capable 
CPU detected. "
                               "The acpi-cpufreq module offers voltage 
scaling"
                               " in addition of frequency scaling. You 
should use "
                               "that instead of p4-clockmod, if 
possible.\n");
                switch (c->x86_model) {
                case 0x0E: /* Core */
                case 0x0F: /* Core Duo */
                        p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
                        return 
speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PCORE);
                case 0x0D: /* Pentium M (Dothan) */
                        p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
                        /* fall through */
                case 0x09: /* Pentium M (Banias) */
                        return 
speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
                }
        }

        if (c->x86 != 0xF) {
                printk(KERN_WARNING PFX "Unknown p4-clockmod-capable 
CPU. Please
 send an e-mail to <cpufreq@lists.linux.org.uk>\n");
                return 0;
        }
