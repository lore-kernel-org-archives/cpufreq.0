From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5353] cpufreq_conservative: cpu always in slowest mode even
	under high load
Date: Tue, 10 Jan 2006 09:42:36 -0800
Message-ID: <200601101742.k0AHgaqp022662@fire-2.osdl.org>
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

linux@brodo.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux@brodo.de



------- Additional Comments From linux@brodo.de  2006-01-10 09:31 -------
OK, it _isnt_ doing thermal throttling at the moment. What does cpufreq-info
(part of cpufrequtils) say when such a situation exists?

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
