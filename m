From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7866] cpufreq fails to correctly identify Intel Conroe
	operating frequencies
Date: Wed, 7 Feb 2007 06:59:38 -0800
Message-ID: <200702071459.l17ExcZd005541@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7866





------- Additional Comments From alexey.y.starikovskiy@intel.com  2007-02-07 06:50 -------
cpufreq works. it switches between right frequencies (they are programmed as 
multipliers for FSB freq). The only "broken" thing is the output of cpufreq, 
there it prints these (multipliers * lowest FSB freq, which is 100Mhz). Values 
to print cpufreq takes from BIOS, so it is BIOS who used 100Mhz instead of 
your 350 for above calculation. 6-9 is a valid range for E6600. if you 
multiply it by default 266 you will get advertised frequencies of E6600, if 
you multiply them by 350, you will have your real frequencies.
cpufreq has no access to FSB frequency, so there is no option but to either 
live with such printouts, or bug your BIOS vendor about it.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
