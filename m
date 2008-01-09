From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9708] powersave governor does not scale down when power gets
	connected
Date: Wed,  9 Jan 2008 01:41:29 -0800 (PST)
Message-ID: <20080109094129.90E88108069@picon.linux-foundation.org>
References: <bug-9708-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9708-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9708





------- Comment #3 from trenn@suse.de  2008-01-09 01:41 -------
I expect you are seeing the same bug:
https://bugzilla.novell.com/show_bug.cgi?id=334378

Compiling the kernel with CONFIG_CPU_FREQ_DEBUG=y and boot with cpufreq.debug=7
parameter. Also add ACPI_DEBUG=y and add acpi.debug_level=0x1f boot parameter
(maybe an ACPI event happens at a certain time that leads to this condition?).
It may also help if you do the performance and back to powersave governor
switches and mark the positions in dmesg logs when those have been issued.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
