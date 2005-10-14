From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 5407] CPUFrequency driver for AMD K8 crashes PC with Sempron
	3400+ CPU
Date: Fri, 14 Oct 2005 09:09:30 -0700
Message-ID: <200510141609.j9EG9UR4002655@fire-1.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5407

mark.langsdorf@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |mark.langsdorf@amd.com
             Status|NEW                         |ASSIGNED



------- Additional Comments From mark.langsdorf@amd.com  2005-10-14 09:07 -------
Gigabyte's excuse is unreasonable: both the Windows and Linux 
PowerNow! drivers are forward compatible with a wide range of 
processor variations, as long as the BIOS supports the processor 
in question.  AMD still strongly suspects this is a BIOS problem.

Fortunately, I had a K8NS in my cube and a stack of Sempron 3400+ 
processors handy.  I've passed the board to the Windows PowerNow! 
driver maintainer for further investigation.  He'll look at in 
on Monday and we should have some answers laster next week.

Our best guess is a misconfigured BIOS but we'll keep investigating.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
