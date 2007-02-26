From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Mon, 26 Feb 2007 09:35:29 -0800
Message-ID: <200702261735.l1QHZTFF032509@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8075





------- Additional Comments From mark.langsdorf@amd.com  2007-02-26 09:35 -------
It's an ACPI bug, not a PowerNow! bug.

The PowerNow! driver calls acpi_processor_register_performance().  If that
fails, it tries to get the pstate data from the PSB BIOS structure.  Multicore
and Multiprocessor systems are not supported by the PSB BIOS structure, so the
driver has no pstate data and fails to instantiate.

If 2.6.18 worked, there is a regression in acpi_processor_register_performance()
in 2.6.20.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
