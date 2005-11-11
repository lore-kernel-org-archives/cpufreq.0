From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Fri, 11 Nov 2005 02:09:14 -0800
Message-ID: <200511111009.jABA9EAh030397@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=5553





------- Additional Comments From akpm@osdl.org  2005-11-11 02:04 -------
bugme-daemon@bugzilla.kernel.org wrote:
>
> http://bugzilla.kernel.org/show_bug.cgi?id=5553
> 
>             Summary: speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
>                      not set

Perhaps you could try adding this, it might tell us a bit more about why
it's failing?

--- devel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~a	2005-11-11 01:42:00.000000000 -0800
+++ devel-akpm/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2005-11-11 01:43:06.000000000 -0800
@@ -373,6 +373,9 @@ static int __init speedstep_init(void)
 		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_level);
 
 
+	printk("sig=%lx, smi_port=%d, smi_cmd=%d\n",
+		ist_info.signature, smi_port, smi_cmd);
+
 	/* Error if no IST-SMI BIOS or no PARM 
 		 sig= 'ISGE' aka 'Intel Speedstep Gate E' */
 	if ((ist_info.signature !=  0x47534943) && ( 
_



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
