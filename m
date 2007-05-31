From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8547] "Hardware error - pending bit very stuck" on Mobile AMD
	Sempron
Date: Thu, 31 May 2007 13:37:56 -0700
Message-ID: <200705312037.l4VKbupo022611@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8547





------- Additional Comments From mark.langsdorf@amd.com  2007-05-31 13:41 -------
Some part of the motherboard or chipset on your machine is failing to complete
the pstate transition to the new frequency and voltage.

What chipset does your laptop use?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
