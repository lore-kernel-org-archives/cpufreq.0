From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5133] Ondemand governor makes system unstable
Date: Sun, 29 Apr 2007 07:37:03 -0700
Message-ID: <200704291437.l3TEb3S0026353@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5133





------- Additional Comments From juha@fsfe.org  2007-04-29 07:37 -------
It seems that the ondemand cpufreq scaling governor has been fixed some where
between 2.6.14 and 2.6.17. Ondemand governor has been my default cpu frequency
governor at least since 2.6.18. I might have used it with 2.6.17.
IIRC I tried to use ondemand with 2.6.14 and 2.6.15 but with same symptoms.


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
