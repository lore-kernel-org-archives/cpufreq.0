From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Fri, 14 Oct 2005 17:19:22 +0200
Message-ID: <20051014151922.GB13688@message-id.gmane0305.slipkontur.de>
References: <88056F38E9E48644A0F562A38C64FB6005DBB974@scsmsx403.amr.corp.intel.com>
	<433C6556.1030803@tremplin-utc.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <433C6556.1030803@tremplin-utc.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Stefan Seyfried <seife@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk

Sorry for coming in late...

On Fri, Sep 30, 2005 at 12:06:14AM +0200, Eric Piel wrote:

> Could it happen that on a P4M the TSC doesn't stop? Then maybe someone 
> with such a harware could try?

i have P4M Hardware at hand (Thinkpads T30, A30, R32) but am on vacation
next week.
If someone pings me on this after 24.october, i might not forget it :-)

I am very interested in getting the latencies down to get rid of the
userspace governor in the powersave daemon (less code to maintain, and
maintained by our kernel guys and not me ;-)
-- 
Stefan Seyfried
