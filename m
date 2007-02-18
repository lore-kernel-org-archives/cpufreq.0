From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8033] CPU loses cpufreq link after offline/online transition
Date: Sun, 18 Feb 2007 06:47:05 -0800
Message-ID: <200702181447.l1IEl5X1022187@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8033

rjwysocki@sisk.pl changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rjwysocki@sisk.pl



------- Additional Comments From rjwysocki@sisk.pl  2007-02-18 06:47 -------
AFAICT, this only happens if the kernel is 32-bit (i386).  At least I'm unable 
to reproduce the problem on nx6325 with x86_64 kernels (2.6.20 or later).


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
