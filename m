From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: ondemand governor
Date: Sat, 25 Sep 2004 08:35:33 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040925063532.GA24558@message-id.gmane0305.slipkontur.de>
References: <20040924142711.GE5746@message-id.gmane0305.slipkontur.de>
	<20040924201724.GA8299@dominikbrodowski.de>
	<20040924205301.GA16470@message-id.gmane0305.slipkontur.de>
	<20040924212953.GA9502@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040924212953.GA9502@dominikbrodowski.de>
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

On Fri, Sep 24, 2004 at 11:29:53PM +0200, Dominik Brodowski wrote:

> Unfortunately, only indirectly. Modprobe cpufreq_ondemand and then 
> cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
> The latency can be deduced then.

10000
 
> Also, which driver do you use?

speedstep-centrino
-- 
Stefan Seyfried
