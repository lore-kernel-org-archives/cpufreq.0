From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Mon, 29 Jan 2007 01:23:49 -0800
Message-ID: <200701290923.l0T9Nn4E022156@fire-2.osdl.org>
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





------- Additional Comments From rui.zhang@intel.com  2007-01-29 01:15 -------
Should the cpu-freq driver be able to handle the invalid information from BIOS?
Cpu frequences of each elements in _PSS should be a decreasing array , this's 
why cpu-freq driver treat states[0].core_frequency as the max_freq.
Then, should we add some error handling for cpu-freq driver to eliminate the 
invalid cpu P-state that breaks the rule? E.g. if (states[i].core_frequency  > 
states[i-1].core_frequency) then discard states[i].
Or export some warnings to userspace at least?


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
