From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 16:38:34 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110153834.GA8303@dominikbrodowski.de>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<1073746849.1047.14.camel@worldmusic.grep.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1073746849.1047.14.camel@worldmusic.grep.be>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Wouter Verhelst <wouter@grep.be>
Cc: cpufreq@www.linux.org.uk


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Note that I had to reboot my box to unload the module. This is probably
> related to the above, but just in case it isn't: I cannot rmmod the
> p4-clockmod module, trying anyway results in rmmod segfaulting -- at
> least once the frequency has been altered. I didn't reboot again just to
> test that, but if you want, it's no problem.

That's unrelated, and I was able to reproduce it on my notebook as well. The
attached patch [which should apply with some offset] should fix that. (Davej:
it applies on top of the p4-clockmod-fixup. Please queue for merging with 
Linus, thanks.)

On Sat, Jan 10, 2004 at 04:02:52PM +0100, Wouter Verhelst wrote:
> > What does /proc/cpuinfo say before modprobing p4-clockmod, and
> > after modprobing p4-clockmod?
> 
> The only difference with the one you already have is the Mhz number
> (which seems logical). Before it's loaded, it's at 2194.424; Immediately
> after loading p4-clockmod, that number was still the same, but in the
> mean time it went back to 1919.054
I think ACPI is messing with us. It detects a high temperature situation,
tries to scale down the CPU, and forces down the CPU speed. Could you send
me the output of /proc/acpi/processor/*/* and /proc/acpi/thermal_zone/*/*
when you notice this situation again?

BTW, could it be that this is still the 2.6.0 module, instead of the 2.6.1
variant? 2.6.1 should report more "clean" values in
/sys/devices/system/cpu/cpufreq/... it should report 2200000 instead of
2193205.

	Dominik

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="p4-clockmod-fix-oops.diff"

Fix an OOPS in unloading. Reverting frequency changes on unloading is
uncommon for cpufreq drivers, so let's remove this speciality.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-01-10 16:26:06.914893464 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-01-10 16:25:25.983116040 +0100
@@ -246,7 +246,7 @@
 static int cpufreq_p4_cpu_exit(struct cpufreq_policy *policy)
 {
 	cpufreq_frequency_table_put_attr(policy->cpu);    
-	return cpufreq_p4_setdc(policy->cpu, DC_DISABLE);
+	return 0;
 }
 
 static struct freq_attr* p4clockmod_attr[] = {

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--cNdxnHkX5QqsyA0e--

