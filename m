From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Thu, 12 Feb 2004 12:35:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <402B6516.1030408@basmevissen.nl>
References: <1076542663.4323.17.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1076542663.4323.17.camel@laptop>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ronald van der Meer <revdmeer@conceptsfa.nl>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>

Ronald van der Meer wrote:
> Hi,
> 
> I have a laptop with an Mobile Intel(R) Pentium(R) 4 cpu and a 82801EB
> ICH5 southbridge.
> I can use the p4-clockmod driver, but it doesn't seem to save any power
> because it only changes the frequency and doesn't do voltage scaling.
> The speedstep-ich driver only seems to support ICH2, 3 and 4 but not 5.
> Is voltage scaling speedstep possible for this laptop?
> 

Hi Ronald,

The p4-clockmod driver only modulates the CPU-clock. That means that the 
clock is running like this: 1111000000001111000000001111 (1=on, 0=off).

Because the clock is running at max CPU speed when on, the voltage 
cannot be lowered. In theory, the voltage could be dropped when the 
clock is off. But because it takes some time before the voltage 
stabilises again, that would mean that the modulation frequency should 
become so slow that it would be very noticable (e.g. jerky mouse movement).

So what you need is speedstep-ich. That driver can both change CPU 
frequency and CPU voltage. But you say it does not support ICH5. Did you 
try it already or did you only read the documentation?

BTW. What labtop do you have?

Regards,

Bas.
