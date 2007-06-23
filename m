From: Len Brown <lenb@kernel.org>
Subject: Re: Power measurements
Date: Sat, 23 Jun 2007 15:44:16 -0400
Message-ID: <200706231544.17062.lenb@kernel.org>
References: <1182603257511@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1182603257511@dmwebmail.belize.chezphil.org>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk
Cc: Phil Endecott <phil_fvnqz_endecott@chezphil.org>

On Saturday 23 June 2007 08:54, Phil Endecott wrote:
> Dear All,
> 
> I would like to share some power consumption numbers that I have just 
> measured on my VIA C7-M system.  It uses the e_powersaver module and 
> can run at 400MHz or 1.2GHz.  I have measured the power consumption 
> when idle and when running a "while(1){}" program at each speed:
> 
>          400    1200
> Idle    16W    16W
> Busy    17W    20W
> 
> What I find interesting is that the idle power at 1.2GHz is identical 
> to that at 400 MHz.
> 
> This makes me wonder if the on-demand governor would actually save any 
> power at all.
> 
> I plan to do some more accurate measurements and to experiment with 
> some different workloads.  Has anyone else done anything like this?

In idle, the processor is executing at 0MHz --
so idle power consumption has little to do with cpufreq.

The exception is if the processor doesn't automatically
adjust it voltage when entering idle.  In this case,
idle power would depend on the frequency of the processor
when idle was entered -- not because of the frequency --
but because of the associated voltage.

I don't know about VIA C7, but some Pentium M's used to
have different idle power depending on the P-state because
of this.  But the more recent ones all have "Enhanced" C-states
where the voltage is automatically lowered in idle.

back to you question -- 20 - 16W = 4W is on the table;
and the performance difference between 400 and 1200 is on the table.
how you choose to use these states will depend on how you use
the machine.

cheers,
-Len
