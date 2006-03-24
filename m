From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5553] speedstep-smi fails to load if CONFIG_CPU_FREQ_DEBUG is
	not set
Date: Thu, 23 Mar 2006 16:17:33 -0800
Message-ID: <200603240017.k2O0HXOc029708@fire-2.osdl.org>
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





------- Additional Comments From akpm@osdl.org  2006-03-23 16:17 -------
Linus Torvalds <torvalds@osdl.org> wrote:
>
> 
> 
> On Thu, 23 Mar 2006, Andrew Morton wrote:
> > 
> > hm.  "any printk before the asm seems to fix the symptom".  That makes me
> > think that the asm might have incorrect constraints or clobbers.
> > 
> > Linus, you're the man.  Does this look OK?
> 
> The thing looks fine, so I suspect it is just that the printk() changes 
> timings.
> 
> On the other hand, it does seem to depend on the _memory_ contents of that 
> "magic_data[]", so maybe adding a
> 
> 	: "memory"
> 
> at the end of the asm would actually help some?
> 
> 		Linus

Can someone please test this?


--- 25/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~a	Thu Mar 23 16:18:19 2006
+++ 25-akpm/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	Thu Mar 23 16:19:07 2006
@@ -75,7 +75,9 @@ static int speedstep_smi_ownership (void
 	__asm__ __volatile__(
 		"out %%al, (%%dx)\n"
 		: "=D" (result)
-		: "a" (command), "b" (function), "c" (0), "d" (smi_port), "D" (0), "S" (magic)
+		: "a" (command), "b" (function), "c" (0), "d" (smi_port),
+			"D" (0), "S" (magic)
+		: "memory"
 	);
 
 	dprintk("result is %x\n", result);
_



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
