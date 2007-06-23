From: "Phil Endecott" <phil_fvnqz_endecott@chezphil.org>
Subject: Re: Power measurements
Date: Sat, 23 Jun 2007 22:30:18 +0100
Message-ID: <1182634218393@dmwebmail.belize.chezphil.org>
References: <200706231544.17062.lenb@kernel.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200706231544.17062.lenb@kernel.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Len Brown wrote:
> On Saturday 23 June 2007 08:54, Phil Endecott wrote:
>> Dear All,
>> 
>> I would like to share some power consumption numbers that I have just 
>> measured on my VIA C7-M system.  It uses the e_powersaver module and 
>> can run at 400MHz or 1.2GHz.  I have measured the power consumption 
>> when idle and when running a "while(1){}" program at each speed:
>> 
>>          400    1200
>> Idle    16W    16W
>> Busy    17W    20W
>> 
>> What I find interesting is that the idle power at 1.2GHz is identical 
>> to that at 400 MHz.
>> 
>> This makes me wonder if the on-demand governor would actually save any 
>> power at all.
>> 
>> I plan to do some more accurate measurements and to experiment with 
>> some different workloads.  Has anyone else done anything like this?
>
> In idle, the processor is executing at 0MHz --
> so idle power consumption has little to do with cpufreq.

Well, the clock is running so signals will still be toggling in the 
processor.  Many of them will be gated off though.

Do other people observe that reducing the clock frequency with cpufreq 
does not reduce idle power consumption?

> The exception is if the processor doesn't automatically
> adjust it voltage when entering idle.  In this case,
> idle power would depend on the frequency of the processor
> when idle was entered -- not because of the frequency --
> but because of the associated voltage.

Ah, I had wondered about this.  According to sensors, Vcore is always 
1.09 V.  (Hmm, I can't be sure that I'm looking at the right line in 
the output of the sensors program, or that it is configured correctly.  
But none of the voltages change.)  Are there any VIA experts reading 
this who know what's supposed to happen?

> I don't know about VIA C7, but some Pentium M's used to
> have different idle power depending on the P-state because
> of this.  But the more recent ones all have "Enhanced" C-states
> where the voltage is automatically lowered in idle.

> back to you question -- 20 - 16W = 4W is on the table;
> and the performance difference between 400 and 1200 is on the table.

Well, in idle, the power difference is zero and the performance 
difference is zero.
When active, on-demand would use the higher frequency anyway.
So it looks to me as if 'on-demand' and 'performance' will behave 
identically in terms of both power and performance.

> how you choose to use these states will depend on how you use
> the machine.

I don't think there's a situation where I would want to use on-demand.

Unless I'm missing something.  Which is quite likely.....


Regards,

Phil.
