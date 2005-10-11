From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5383] VIA Nehemiah ondemand scaling governor critical DMA error
Date: Mon, 10 Oct 2005 18:48:34 -0700
Message-ID: <200510110148.j9B1mY0O017867@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5383

akpm@osdl.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |akpm@osdl.org



------- Additional Comments From akpm@osdl.org  2005-10-10 18:46 -------
Why is there linkage between ongoing DMA transfers and the
CPU frequency?   Confused.

Perhaps we could do something gross like capturing all the CPUs
and spinning for a second before changing speed?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
