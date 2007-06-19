From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Mon, 18 Jun 2007 22:02:43 -0700 (PDT)
Message-ID: <20070619050243.C20DB10812A@picon.linux-foundation.org>
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





------- Comment #30 from daniel@pressure.net.nz  2007-06-18 22:06 -------
(In reply to comment #20)
> >Len, hope this is sufficient info for you. Kernel compiled with cpufreq debug
> >enabled, and booted with cpufreq.debug=7
> Please
> #echo 0x1f >/sys/module/acpi/parameter/debug_level
> and modprobe the cpufreq driver again.
> Hope we can get more information from the _dmesg_ output.

With 2.6.22-rc3, I'm unable to modprobe acpi or acpi-cpufreq ("No such device")
and thus unable to echo the 0x1f debug flag. lsmod shows asus-acpi already
loaded however.

Attaching an updated dmesg output.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
