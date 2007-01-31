From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5353] cpufreq_conservative: cpu always in slowest mode even
	under high load
Date: Wed, 31 Jan 2007 01:28:53 -0800
Message-ID: <200701310928.l0V9SrOv018196@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5353

akpm@osdl.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |akpm@osdl.org



------- Additional Comments From akpm@osdl.org  2007-01-31 01:20 -------
Are these problems still present in 2.6.20-rc7?

Thanks.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
