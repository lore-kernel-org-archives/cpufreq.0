From: Jarkko Lavinen <jlavi@iki.fi>
Subject: [PATCH] Another powernow-k7 patch for Desktop XP-M usage
Date: Fri, 14 Jan 2005 13:46:56 +0200
Message-ID: <20050114114656.GA8185@smooth.piipiip.net>
References: <200410150905.08176.Hendrik.Muhs@web.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Resent-Message-Id: <200501141204.j0EC4Yk8011003@smooth.piipiip.net>
Content-Disposition: inline
In-Reply-To: <200410150905.08176.Hendrik.Muhs@web.de>
Resent-To: cpufreq@ZenII.linux.org.uk
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@ZenII.linux.org.uk
Cc: Hendrik Muhs <Hendrik.Muhs@web.de>

On Fri Oct 15, 2004 at 08:05:07, Hendrik Muhs wrote:
> A new corrected patch is attached to this mail

Many thanks for the XP-M patch.  I am using it on 2.6.9 and running
XP-M at 1.1Vcore. The max cpu clock at this Vcore is about 1200MHz
or multiplier 9 on 133MHz FSB. 

The patch assumes the CPU is running at the highest normal multiplier, 
that would be 14 cpu running at around 1800MHz. It then calculates
the FSB frquency from cpu clock and the assumed multiplier.  As a result, 
a wrong FSB and frequencies are calculated.

For a quick remedy, I added a new module option "multiplier_limit" which
limits the queried multiplier to no higher than the given limit.

  overwrite_table=1 multiplier=3,4,5,6,7,8,9 debug=1 multiplier_limit=9

  powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
  powernow: FSB: 135.405 MHz
  powernow: Overwriting PST table with manual settings
  powernow: Settling Time: 200 microseconds.
  powernow:    FID: 0x10 (3.0x [406MHz])  VID: 0xb (1.450V)
  powernow:    FID: 0x12 (4.0x [541MHz])  VID: 0xb (1.450V)
  powernow:    FID: 0x4 (5.0x [677MHz])   VID: 0xb (1.450V)
  powernow:    FID: 0x6 (6.0x [812MHz])   VID: 0xb (1.450V)
  powernow:    FID: 0x8 (7.0x [947MHz])   VID: 0xb (1.450V)
  powernow:    FID: 0xa (8.0x [1083MHz])  VID: 0xb (1.450V)
  powernow:    FID: 0xc (9.0x [1218MHz])  VID: 0xb (1.450V)
  powernow: Minimum speed 406 MHz. Maximum speed 1218 MHz.

With this modification the FSB and CPU frequencies are repoted correctly.
It would be better if the currently used multiplier could be detected 
without resorting to setting manual limit, though.

Jarkko Lavinen
