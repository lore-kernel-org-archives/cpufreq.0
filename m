From: Stephen White <stephen-cpufreq@earth.li>
Subject: longhaul driver broken?
Date: Sun, 1 Feb 2004 15:44:49 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040201154449.GA30954@the.earth.li>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I'm using the 2.4 backport (from
http://ftp.linux.org.uk/pub/linux/cpufreq/) because of issues with
drivers for another piece of hardware in my system.  However it appears
the longhaul driver is rather broken.

The first problem is in the longhaul_table code.  The 'index' member of 
each element in the table gets initialised as follows:
       longhaul_table[k].index = (j << 8);

The 'longhaul_target' routine then obtains this value using:
       new_clock_ratio = longhaul_table[table_index].index & 0xFF;

Thus 'new_clock_ratio' is /always/ found to be zero and so the driver 
has no effect.


If I fix this then I can change the speed of my processor, but things
still don't behave perfectly.  I haven't looked into this, but I think
this may in part be due to the rather random ordering of elements in the
table, debug reveals:

longhaul: longhaul_table[0].frequency = 399 (ratio 30, fsb 133)
longhaul: longhaul_table[1].frequency = 532 (ratio 40, fsb 133)
longhaul: longhaul_table[2].frequency = 465 (ratio 35, fsb 133)
longhaul: longhaul_table[3].frequency = 598 (ratio 45, fsb 133)
longhaul: longhaul_table[4].frequency = 731 (ratio 55, fsb 133)
longhaul: longhaul_table[5].frequency = 798 (ratio 60, fsb 133)
longhaul: longhaul_table[6].frequency = 665 (ratio 50, fsb 133)


[ as an aside does anyone know the minimum safe frequency for a VIA Ezra
C3 800  (family 7, mode 7, stepping 8).  It seems to work at 400Mhz 
without crashing, but I'm not sure it's supposed to. ]


Does anyone have some insight into the longhaul driver, or is there a
better version somewhere that I should be using?  If this is the code
I'm supposed to be using and there's no-one fixing it, is anyone
interested in receiving some patches for it from me?

Thanks,

Stephen
