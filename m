From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7866] cpufreq fails to correctly identify Intel Conroe
	operating frequencies
Date: Tue, 6 Feb 2007 23:00:31 -0800
Message-ID: <200702070700.l1770Voc024250@fire-2.osdl.org>
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





------- Additional Comments From alexey.y.starikovskiy@intel.com  2007-02-06 22:51 -------
Jared,
What frequency is set for your FSB? is it 266/1066 or something else?
Some people reported that they see such frequency values from BIOS if they (or 
mainboard manufacturer) overclocked the FSB. Could you check if you see right 
values if the FSB is set to default above? 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
