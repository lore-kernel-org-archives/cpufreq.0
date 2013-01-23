From: David C Niemi <dniemi@verisign.com>
Subject: Re: New governor?
Date: Wed, 23 Jan 2013 15:42:45 -0500
Message-ID: <51004B45.70209@verisign.com>
References: <20130123190711.GA8394@jshin-Toonie> <2365004.JupvNoxXgf@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <2365004.JupvNoxXgf@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Jacob Shin <jacob.shin@amd.com>, cpufreq@vger.kernel.org

On 01/23/13 14:15, Rafael J. Wysocki wrote:
> On Wednesday, January 23, 2013 01:07:12 PM Jacob Shin wrote:
>> Rafael, cpufreq list,
>>
>> I was wondering ..
>>
>> - Is hardware architecture specific governor acceptable in upstream?
>>   i.e. drivers/cpufreq/cpufreq_amd_governor.c
> It generally is, although the details of implementation matter too.
>
> Thanks,
> Rafael
>
>
Intel has also been talking about hardware-specific driver/governor bundles.  For now, I'd say go ahead, try to make it backwards compatible if that makes sense, and regard it as experimental.  In the long run we will need to generalize what it is doing so we can once again have a higher-level, hardware-independent configuration API over the hardware-specific governors.  Linux Distributions aren't going to want to use hardware-specific APIs to configure a machine, so they will likely ignore your (and Intel's) governor until there is a generic interface.

DCN
