From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5122] cpufreq/powernowd is still not working on my AMD64x2
	3800+
Date: Thu, 1 Feb 2007 13:52:51 -0800
Message-ID: <200702012152.l11Lqpu7007291@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5122

etorix@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |CLOSED
         Resolution|                            |CODE_FIX



------- Additional Comments From etorix@gmail.com  2007-02-01 13:44 -------
Bug was reported for 2.6.13-rc7 32-bit [i stopped using powernow-xx on that box]
Result from  Linux version 2.6.20-rc7-eto-1 (etorix@gigabod) (gcc version 4.1.2
20061115 (prerelease) (Debian 4.1.1-21)) #1 SMP Thu Feb 1 20:23:26 GMT 2007
Feb  1 21:14:00 gigabod kernel: BIOS-provided physical RAM map:
from /var/log/messages:
Feb  1 21:14:04 gigabod powersaved: Loading powernow_k8
Feb  1 21:14:04 gigabod kernel: powernow-k8: Found 2 AMD Athlon(tm) 64 X2 Dual
Core Processor 3800+ processors (version 2.00.00)
Feb  1 21:14:04 gigabod kernel: powernow-k8: invalid freq entries 3900000 kHz
vs. 65535000 kHz
Feb  1 21:14:04 gigabod last message repeated 3 times
Feb  1 21:14:04 gigabod kernel: powernow-k8:    0 : fid 0xc (2000 MHz), vid 0xa
Feb  1 21:14:04 gigabod kernel: powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12
Feb  1 21:14:04 gigabod powersaved: enter 'powernow_k8' into CPUFREQD_MODULE in
/etc/powersave/cpufreq.
Feb  1 21:14:04 gigabod powersaved: this will speed up starting powersaved and
avoid unnecessary warnings in syslog.
Feb  1 21:14:05 gigabod powersaved: Starting powersaved with ACPI support

looks pretty much fixed, for 32-bit SMP , to me,eh
ta, a kelly 
Submitter:   	etorix@gmail.com (etorix)


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
