From: aeriksson@fastmail.fm
Subject: Re: speedstep capability checks
Date: Thu, 18 Mar 2004 20:57:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040318195720.D89C43F04@latitude.mynet.no-ip.org>
References: <ducrot@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: Message from Bruno Ducrot <ducrot@poupinou.org> of "Tue,
	16 Mar 2004 17:36:04 +0100." <20040316163604.GK28592@poupinou.org> 
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
To: Bruno Ducrot <ducrot@poupinou.org>, Dave Jones <davej@redhat.com>
Cc: Arjan van de Ven <arjanv@redhat.com>, cpufreq@www.linux.org.uk



davej@redhat.com said:
>> A few SpeedStep-capable systems don't perform according to
>> specification: the CPUID and/or some MSRs don't tell us the 
>> CPU is SpeedStep capable even though it definitely is.

> Is there nothing in the errata documents about this ? 

<snip>

> I'd merge this really as a last resort, and it's beginning to sound
> like we don't really have any options (other than not support those
> broken boxes). Ugh. 


...and ducrot@poupinou.org replied:
> There is nothing in any data sheets for the check anyway, other than
> it's not possible to distinguish a PIII (coppermine) with Speedstep
> technology from one without Speedstep technology.  There is nothing
> in any spec update I'm aware. 


So, is the patch ok to merge?

/Anders
