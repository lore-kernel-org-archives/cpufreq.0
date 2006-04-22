From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [Bug 6426] Working Longhaul driver removed from kernel
Date: Sat, 22 Apr 2006 22:42:55 +0200
Message-ID: <444A954F.5030408@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

> http://bugzilla.kernel.org/show_bug.cgi?id=6426
 >
> ------- Additional Comments From davej at codemonkey.org.uk  2006-04-22 10:50 -------
> You got lucky.  It's completely broken (In part due to the quirky hardware
> design of longhaul), and needs significant effort to fix.
> (There needs to be infrastructure work done to quiesce dma from IDE/SCSI during
> speed transitions, otherwise real bad things can happen ranging from lock-ups,
> to disk corruption.)
> 
> It's possible you never hit it because you were using conservative which doesn't
> change the speed very often, however in some cases a single transition is enough
> to hit the bug.
> 

I try to hang my machine. It's imposible with cpufreq. In worst case 
there is 2-10 secs freeze. But only when delta f is big (example 
532<->997). Only way to hang machine is "modprobe viafb" with hw accel 
enabled.


----------------------------------------------------------------------
Swietnie zdjecia do poogladania >>> http://link.interia.pl/f192b 
