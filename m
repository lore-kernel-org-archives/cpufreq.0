From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8033] CPU loses cpufreq link after offline/online transition
Date: Thu, 26 Apr 2007 10:15:07 -0700
Message-ID: <200704261715.l3QHF7Gb021339@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8033

trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ak@suse.de



------- Additional Comments From trenn@suse.de  2007-04-26 10:15 -------
This does not look like a cpufreq problem... for now I found out that the 
vendor string gets overridden when the CPU gets offlined:

Apr 26 19:10:47 adalid kernel: Checking CPU 0
Apr 26 19:10:47 adalid kernel: k
Apr 26 19:10:47 adalid kernel: u
Apr 26 19:10:47 adalid kernel: vendor: 2 - We have an AMD CPU ...
Apr 26 19:10:47 adalid kernel: a
Apr 26 19:10:47 adalid kernel: b
Apr 26 19:10:47 adalid kernel: c
Apr 26 19:10:47 adalid kernel: d
Apr 26 19:10:47 adalid kernel: e
Apr 26 19:10:47 adalid kernel: CPU 0 supported
Apr 26 19:10:47 adalid kernel: Checking CPU 1
Apr 26 19:10:47 adalid kernel: k
Apr 26 19:10:47 adalid kernel: u
Apr 26 19:10:47 adalid kernel: vendor: 255 - NOT AN AMD CPU ?!?
Apr 26 19:10:47 adalid kernel: Checking CPU 2
Apr 26 19:10:47 adalid kernel: k
Apr 26 19:10:47 adalid kernel: u
Apr 26 19:10:47 adalid kernel: vendor: 255 - NOT AN AMD CPU ?!?
Apr 26 19:10:47 adalid kernel: Checking CPU 3
Apr 26 19:10:47 adalid kernel: k
Apr 26 19:10:47 adalid kernel: u
Apr 26 19:10:47 adalid kernel: vendor: 255 - NOT AN AMD CPU ?!?
Apr 26 19:10:47 adalid kernel: Num online: 4

This is in powernow-k8.c:check_supported_cpu(unsigned int cpu) here:

	if (current_cpu_data.x86_vendor != X86_VENDOR_AMD){
		printk ("vendor: %d - NOT AN AMD CPU ?!?\n", 
current_cpu_data.x86_vendor);
		goto out;
	}

	printk ("vendor: %d - We have an AMD CPU ...\n", 
current_cpu_data.x86_vendor);

Remember: This is a 32 bit kernel problem!
I will try some more tomorrow...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
