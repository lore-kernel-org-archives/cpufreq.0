From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Tue, 23 Sep 2003 10:51:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F700975.9090402@basmevissen.nl>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>	<3F6ACB0E.8050009@basmevissen.nl>
	<m2r82avdm6.fsf@tnuctip.rychter.com>	<3F6EAC05.7090009@basmevissen.nl>
	<m24qz4lgm9.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <m24qz4lgm9.fsf@tnuctip.rychter.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

Jan Rychter wrote:
>>>>>>>>"Bas" == Bas Mevissen <ml@basmevissen.nl> writes:
>>
>>
>>Do you measure this from the ACPI battery output? 
> 
> Yes.
> 

OK. Do you know of a way to see the power usage when on AC-adapter? I'm 
wondering if there isn't something in the on-board power circuit to see 
the actual power usage of the PC or just CPU or motherboard.

> No, I have verified this (with bogomips) and the above results are
> true. The CPU does indeed slow down properly as directed by
> cpufreq. Also, in my case connecting and disconnecting the AC adapter
> doesn't change the CPU speed.
> 
> So, the results still hold -- and it seems it simply doesn't make much
> sense to slow down a Pentium-M, unless you really keep the CPU busy?
> 

Very interesting conclusion. It could mean three things:
1) The internal power management of the Pentium-M (when using APM or 
ACPI idle calls) is very good
2) The speedstepping of the Pentium-M doesn't bring enough
3) We are interpreting something wrong :-)

 From your conclusions, 1) would be the most reasonable and most 
favourable result.

Bas.
