From: Stefan Gehn <sgehn@gmx.net>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Mon, 30 Jun 2003 21:14:11 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306302114.11640.sgehn@gmx.net>
References: <200306301436.29188.lbelli@crema.unimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200306301436.29188.lbelli@crema.unimi.it>
Content-Disposition: inline
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

On Monday June 30 2003 14:36, Luigi Belli wrote:
> I'm one of the owners of an Acer Aspire 1300 series with a buggy BIOS, so I
> decided to hardcode a patch with the correct PST table for my mobile Athlon
> XP 1800+.

Nice work :)

> I know very little of kernel internals, I only opened powernow-k7.c and
> tried to guess what had to be changed...
> For me it works and I decided to post it here for those in my conditions
> waiting for a new bios or a newer cpufreq release.
> It's a patch against kernel 2.4.21-ac4.

How to make this work for my xp 1500+?
I assume just stripping the 1533 Mhz setting and decreasing the length by 2 
should be enough, no? Otherwise, how to get the right voltages and 
multipliers for my CPU?

Bye, Stefan aka mETz
-- 
sgehn_AT_gmx.net | ICQ#51123152 | Moege der Pinguin mit euch sein
