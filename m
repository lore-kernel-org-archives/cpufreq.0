From: Andreas Koch <a_koch@moellinger.hx.uni-paderborn.de>
Subject: Problems with cpufreq on Acer Aspire Notebook
Date: Tue, 8 Jul 2003 17:22:33 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030708172233.4be9c44b.a_koch@moellinger.hx.uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hi,

I couldn't find something like a search funktion for your mail archiv so
I have to post my question without knowing if this was done already
(sorry for this).

I have a Acer Aspire Notebook, running Debian Woody with 2.4.20 Kernel
and the cpu-freq patch 2.4.20-9. (I know that the same Problem from
someone else on a 2.4.21 Kernel with the 2.4.21 patch).

The Notebook has a mobile AMD Athlon XP 1800+ Processor with 1.5 GHz (
3060.53 Bogomips shown at startup). When the system is up /proc/cpuinfo
shows only 800 MHz and 1596.79 Bogomips. /proc/cpufreq says min =
500000, max = 600000 MHz and demesg shows something like :

powernow:  cpuid: 0x781 fsb: 100        maxFID: 0xe     startvid: 0xb
 powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
 powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
 powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
 powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
 powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xc (1.400V)
 powernow: Minimum speed 500 MHz. Maximum speed 600 MHz.

My question is now what's wrong ?

I didn't find anything on google so I have to ask here for your help.

Yours,

Andreas
