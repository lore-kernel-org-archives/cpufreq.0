From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Mon, 29 Jan 2007 17:44:35 -0800
Message-ID: <200701300144.l0U1iZOA020125@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7880

rui.zhang@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |rui.zhang@intel.com
             Status|NEW                         |ASSIGNED



------- Additional Comments From rui.zhang@intel.com  2007-01-29 17:36 -------
Claas:
Maybe you can do this test:
1. recompile the kernel with CONFIG_CPU_FREQ_DEBUG=y and CONFIG_ACPI_DEBUG=y
2. remove module acpi_cpufreq after boot
2. #dmesg -c
   #echo 0x1f >/proc/acpi/debug_level
   #echo 7 >/sys/module/cpufreq/parameters/debug
3. load module acpi_cpufreq
and attach the dmesg output then.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
