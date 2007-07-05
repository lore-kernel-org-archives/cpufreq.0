From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Thu,  5 Jul 2007 04:23:40 -0700 (PDT)
Message-ID: <20070705112340.2A8F4108094@picon.linux-foundation.org>
References: <bug-8228-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8228-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8228





------- Comment #45 from daniel@pressure.net.nz  2007-07-05 04:28 -------
(In reply to comment #44)
> ok, this looks promising, but Ubuntu kernel is known to be highly modified.
> I think you still need to _compile_ 2.6.17 with cpufreq debug and acpi debug
> info. Could you also attach /proc/acpi/processor/* ?
> 

Ok, I think the mystery is solved. Rather than compiling 2.6.17, I compared
speedstep-centrino.c from Ubuntu's 2.6.17 kernel package, against the upstream
source. Ubuntu have obviously patched it, adding freq/voltage tables for
Pentium M Dothan cores (upstream only supports Banias). They've also done this
in their 2.6.20 package for Feisty.

So I guess my notebook has broken ACPI BIOS, and the frequency scaling has only
ever worked because of the linux-phc patches that Ubuntu were applying :(

Hopefully they'll at least keep doing that, to save me from having to patch it
myself each time. I still don't understand why these patches for the Dothan
cores have never made it into mainline...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
