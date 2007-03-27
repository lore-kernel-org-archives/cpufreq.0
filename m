From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 27 Mar 2007 10:11:11 -0700
Message-ID: <200703271711.l2RHBBP7006922@fire-2.osdl.org>
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





------- Additional Comments From mark.langsdorf@amd.com  2007-03-27 10:11 -------

> ------- Additional Comments From babassu@postmaster.co.uk  
> 2007-03-27 08:40 -------
> The powernow-k8 module reports this when starting up:
> [   33.429966] powernow-k8: Found 2 AMD Athlon(tm) 64 X2 Dual 
> Core Processor
> 3800+ processors (version 2.00.00)
> [   33.430014] powernow-k8:    0 : fid 0xc (2000 MHz), vid 0x8
> [   33.430018] powernow-k8:    1 : fid 0xa (1800 MHz), vid 0xa
> [   33.430021] powernow-k8:    2 : fid 0x2 (1000 MHz), vid 0x12

Looks pretty normal.

> The MB (ASUS A8V-MX) chipset is VIA K8M800 + VT8251 The BIOS 
> is American Megatrends Inc. version 0405 from 11/09/2005

Thanks.  I haven't seen this problem on VIA before.

> I did not look at the current code but I have seen a version 
> with a loop incrementing a counter waiting for the bit.
> Maybe that loop (if it is still there) is too short for a fast CPU. 

It reads the MSR 10000 times before retrying, and retries
100 times before giving up.  If an operation that is 
supposed to take 10s of microseconds hasn't completed in 
a few hundred milliseconds, I don't know that it will.

I can send you a patch if you want to try longer timeouts.
Also, is there a more recent BIOS?  November 2005 is a bit
old.

-Mark Langsdorf
AMD, Inc.





------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
