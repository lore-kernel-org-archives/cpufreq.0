From: Erich Boleyn <erich@uruk.org>
Subject: Re: do Pentium4 & PentiumM consume about the same at their lowest
	possible freq?
Date: Fri, 03 Aug 2007 15:34:50 -0700
Message-ID: <E1IH5jO-0002Yz-GW@uruk.org>
References: <653FFBB4508B9042B5D43DC9E18836F50139486C@scsmsx415.amr.corp.intel.com>
	<46B394D5.4030509@unica.it>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <46B394D5.4030509@unica.it> 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roberto De Leo <deleo@unica.it>
Cc: cpufreq@lists.linux.org.uk


FYI, I work at AMD currently, and worked at Intel in the past.  The
model discussed below is an approximation, and some circuit or process
geek can correct me if they care to.  ;-)


Roberto De Leo <deleo@unica.it> wrote:

> I thought that power consumption and heat dissipation in the CPU were 
> more or less proportional but evidently my belief was too naif  :-)
> 
> I guess that the same thing holds for the Athlon64 so prolly centrino is 
> the only CPU were I can get a substantial power saving by decreasing the 
> freq when I don't need much of it (which is almost always), is this 
> correct?


  --  "Frequency Scaling" is when the freqency is increased or decreased,
        usually by fixed factors or to fixed step values.  In an ideal
        world, power consumption is linear with frequency given you keep
        the voltage(s) the same.  In practice, you have leakage, so,
        roughly, at a given set of voltages the eq, looks like:

           Power =  Fixed_Power + Freq * (watt/Hz)

        NOTE: The Fixed_Power and (watt/Hz) values vary based on the
        processor and voltage type.

  --  "Throttling" is a bit like frequency scaling.  The number of clock
        edges is reduced, often by stuttering (times the clock is running
        vs. times it is not), with similar power results.

  --  "Voltage Scaling" roughly changes power as a square with another
        semi-constant:

           Power =  Fixed_Power_2 + V^2 * (watt/V^2)


Now, with all that intro, here's the mechanisms used by the different
chips involved to my knowledge:

  --  Pentium 4 supported Throttling - used to keep the part from
        overheating, and not really useful for power savings in general.

  --  Pentium M, Core, and Core 2 support freq/voltage scaling and maybe (?)
        also Throttling.  Don't know when they started supporting it in
        server configs.

  --  (don't remember what Athlon (K7) supported, I think the mobile
        version had freq/voltage scaling)

  --  Opteron/Athlon64 support freq/voltage scaling across the whole line.


I think the multi-socket (i.e. SMP server) support for freq/voltage
scaling only came into products since about 2004-2005.  I know
Opterons/Athlon64's had it in 2004, but don't know/remember where it
intersected into Intel products.

Results of all this says that you get *less* than linear benefits from
scaling frequency back or throttling alone.  Luckily, you can often
reduce voltage when scaling back the frequency, and in that case it's
really the voltage reduction which gives you most of the power savings.


So, whenever possible use a freq/voltage scaling combination, which is
what Enhanced Speedstep and Powernow have been doing for a while.


--
    Erich Stefan Boleyn     <erich@uruk.org>     http://www.uruk.org/
"Reality is truly stranger than fiction; Probably why fiction is so popular"
