From: John Belmonte <john@neggie.net>
Subject: Re: powernow-k8 and stuck change-pending bit
Date: Sat, 09 Jul 2005 10:29:21 -0400
Message-ID: <42CFDF41.3040504@neggie.net>
References: <84EA05E2CA77634C82730353CBE3A843028F4CC5@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843028F4CC5@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@lists.linux.org.uk

Devriendt, Paul wrote:
>>symptoms:
>>
>>    After working fine for a while (several minutes to several hours),
>>cpufreq seems to get into a bad state where:
>>
>>     * change pending bit set / stuck kernel messages appear
>>
>>     * reloading powernow-k8 module fails, with "change 
>>pending bit stuck"
> 
[...]
> The most likely scenario here is the VRM was unable to change
> voltage, and that means flaky hardware as it has previously been
> able to successfully do so. The reason I pick on the VRM and not
> some sort of issue with the HyperTransport fabric is that it is
> unlikely anything would still be alive if there was some sort of 
> problem coming back from the LDT_STOP.
> 
> Assuming the VRM continues to supply the current voltage within 
> spec, the system will stay up indefinitely, at the current
> voltage and frequency.
> 
> The best path to follow would be to investigate warrantee replacement
> of the board.

Thanks for the info Paul.  I've had the motherboard replaced with an
identical model.  This new board seems to have the same problem, except
that when a transition finally fails, Linux hangs bad enough to require
a hard reset of the system.

With two boards having this problem, it suggests either a bad
motherboard design or some bad interaction between Linux and the
motherboard.  (It seems strange that the manufacturer wouldn't have seen
this problem under Windows.)  Much less likely is that I have a bad CPU.

--John
