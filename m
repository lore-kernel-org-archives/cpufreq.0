From: Holger Moser <hmoser@mosesonline.com>
Subject: Re: Acer Aspire 1301XV (Athlon-XP Mobile 1500+) BIOS gives "broken"
	PST
Date: Sun, 21 Sep 2003 14:33:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200309211433.24847.hmoser@mosesonline.com>
References: <32990.172.16.0.160.1064142492.squirrel@webmail.mosesonline.com>
	<200309211344.03027.hmoser@mosesonline.com>
	<200309211353.45167.lbelli@crema.unimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <200309211353.45167.lbelli@crema.unimi.it>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Am Sonntag, 21. September 2003 13:53 schrieb Luigi Belli:
> On Sunday 21 September 2003 13:44, Holger Moser wrote:
> > i see. so acer didnt care much about this fact. i only have one pst in my
> > bios which has only 500 and 600 mhz at 1.4volt (2 times each).
>
> Oh, I forgot to tell you: this problem seems to afflict only bios 3a71, so
> you can try downgrading to the version 3a21 and see if your cpu is
> supported (I tried to do so but my cpu wasn't known by that bios).

hmmm.. maybe ill give it a try.. if it can handle my cpu correct and the 
tables in this bios are correct.. i could just dump them from there and the 
reupgrade to 3a71, patch cpufreq with a correct "faked" pst.
