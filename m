From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: 21 Feb 2005 13:11:34 +0000
Message-ID: <20050221105055.GD15599@message-id.gmane0305.slipkontur.de>
References: <20050220131518.GB4495@inskipp> <4218B768.8020401@tremplin-utc.net>
Mime-Version: 1.0
Resent-Message-ID: <20050221131134.GA24296@message-id.gmane0305.slipkontur.de>
Resent-To: cpufreq@lists.linux.org.uk
Content-Disposition: inline
In-Reply-To: <4218B768.8020401@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

On Sun, Feb 20, 2005 at 05:14:32PM +0100, Eric Piel wrote:
 
> It would make the patch 5 lines instead of 50. Every userspace deamon 
> have this feature enabled by default, so this is a very reasonable 
> trade-off.

I'm sure that you cannot imagine how much beating i have gotten for making
CONSIDER_NICE=no the default for the powersaved on SUSE 9.1... :-)
It took man-weeks of debating what could be a sensible default for this.
This has to be tweakable.
-- 
Stefan Seyfried
