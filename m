From: aeriksson@fastmail.fm
Subject: Speedstep detection fails
Date: Fri, 19 Dec 2003 23:59:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031219225936.D41E43FB2@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk


Hi all,

Running with the latest cvs, I need to apply the following 
patch to speedstep-lib to get it to detect properly on my 
Dell Latitude 400. Anyone see anything wrong with it, or can
it be applied to the cvs?

BR,
/Anders 





--- ../../cf-2.6/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c 2003-08-19 15:38:33.000000000 +0200
+++ arch/i386/kernel/cpu/cpufreq/speedstep-lib.c        2003-11-10 21:41:12.325084272 +0100
@@ -200,7 +200,7 @@
                 */
                rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
                dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
-               if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
+               if ((msr_hi & (1<<18)) ) {
                        if (c->x86_mask == 0x01)
                                return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
                        else
