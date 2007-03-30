From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Fri, 30 Mar 2007 13:51:23 -0700
Message-ID: <200703302051.l2UKpNXd009637@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From babassu@postmaster.co.uk  2007-03-30 13:51 -------
Created an attachment (id=11001)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11001&action=view)
dmesg showing possible problem

I think I caught a problem for the situation that happens most.
Going down from 2000MHz 1.35V to a lower state (in this case 1800MHz 1.30V)
does not respect the guide (Chapter 9.5.6.2.2 - Changiing the FID):
"Note: Software must hold the VID constant when changing the FID."
This is what I captured;
============current state=================
[  887.141864] targ: curr fid 0xc, vid 0x8
[  887.141867] cpu 0 transition to index 1

[  887.141869] table matched fid 0xa, giving vid 0xa

[  887.149844] p-state change confirmed LO=0x60c0c0c HI=0x12060808
============illegal request ?=============
[  887.149849] cpu 0, changing to fid 0xa, vid 0xa

The bit got stuck after that.
I will investigate the code to see why it happened.


------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
